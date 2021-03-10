import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'globals.dart' as globals;

import 'package:viena_kalevala_game/timer_animation_classic.dart';
//import 'package:quiver/async.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:viena_kalevala_game/audio_noweb.dart' // Stub implementation
if (dart.library.html) 'package:viena_kalevala_game/audio_web.dart'; // dart:html implementation


Color jadeColor = Colors.teal;
Color jadeAccentColor = Colors.tealAccent;
Color poolColor = Color(0xff97CCD0);
Color strawberryColor = Color(0xffDD4835);
Color blushColor = Color(0xffEF8D81);


class Kalevala extends StatefulWidget {
  @override
  _KalevalaState createState() => _KalevalaState();
}

enum TtsState { playing, stopped }

class _KalevalaState extends State<Kalevala> with TickerProviderStateMixin{

  FlutterTts flutterTts = FlutterTts();
  var ttsState;
  Future _speak(text) async{
    String karelian = convertToKarelianPhonetic(text);
    var result = await flutterTts.speak(karelian);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  convertToKarelianPhonetic(String text) {
    text = text.replaceAll('c', 'ts');
    text = text.replaceAll('č', 'tsh');
    text = text.replaceAll('šš', 's');
    text = text.replaceAll('š', 'sh');
    text = text.replaceAll('ž', 'j');
    print(text);
    return text;
  }

  final _c = TextEditingController();
  int _questionNumber = 1;
  int _correctPosition = -1;
  bool _correctAnimation = false;
  Color _nextButtonColor =Colors.white;
  int _timeLeft = 20;
  var earnedCoin = false;

  AnimationController controller;

  int get secondsLeft {
    Duration duration = controller.duration * controller.value;
    return duration.inSeconds % 60;
  }

  String get timerString {
//    print(controller.duration);
//    print(controller.value);
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}'
        ':${(duration.inMilliseconds % 1000).toString().substring(0,1)}';
  }


  String _playerAnswer = "";
  var coins = 10;

  var _firstTime =1;

  List<List<dynamic>> questions;


  @override
  void initState() {
    _getThingsOnStartup().then((value){
      print('Async done');
      if(globals.totalPoints<=0){
        _introDialog(context, "Tervetuloa Kalevalan korttipeliin.",
            "Vastaa niin moniin oikeisiin kysymyksiin, ennen kuin aika loppuu. Mennään !");
        if(globals.userName==" ") _nameDialog(context, 'asd ');
      }
    });
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

  }


  Future _getThingsOnStartup() async {
    await loadAsset('assets/kalevala1.csv').then((dynamic output) {
      var csvRaw = output;
      print(csvRaw);
      List<List<dynamic>> csvTable = CsvToListConverter().convert(output);
      questions = csvTable;
      print(questions);
    });
  }
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }


  String target = 'Mieleni minun tekevi';
  String correctAnswer ="Mieleni miun luajittauve,";
  var _choices = {'miun': 2, 'Mieleni': 0, 'luajittauve,': 1};





  String _selectedChoice="";
  List<String> _selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();
    _choices.forEach((option,k){
      Color _selectedColor;
      choices.add(Container(

        padding: const EdgeInsets.all(1.0),
        child: ChoiceChip(
          label: Text(option),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: MediaQuery.of(context).size.width/30 > 30? 30:MediaQuery.of(context).size.width/30  , fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: _selectedColor,
          selected: _selectedChoices.contains(option),
          onSelected: (selected) {
            setState(() {
              if(_selectedChoices.contains(option)){
                _selectedChoices.remove(option);
                _playerAnswer = "";

              } else {
                _selectedChoices.add(option);
                _playerAnswer = _playerAnswer + option + " ";
              }
            });
//            print(k);
//            print(option);
//            if(k==1){
//              setState(() {
//                _selectedChoice = option;
//                _correctPosition=k;
//
//                _selectedColor = Colors.greenAccent;
//                });
////              widget.notifyParent(k);
//            };
          },
        ),
      ));
    });
    return choices;
  }


  void _loadNextQuestion() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      _correctAnimation=false;


      setState(() {
        _questionNumber++;
        updateQuestion();
        _nextButtonColor =Colors.white;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//            icon: Icon(
//              Icons.ac_unit,
//              color: Colors.black,
//            ),
//            onPressed: () {}),
//        title: Text(
//          "Synonym Flashcards",
//          style: TextStyle(
//            color: Colors.black,
//          ),
//        ),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(
//                Icons.note_add,
//                color: Colors.black,
//              ),
//              onPressed: () {
//                //
//              }),
//        ],
//      ),
      body: Center(
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: Container(
            width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/8,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/4.8,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  //color: new Color(0xffffc107),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.greenAccent,
                  ),
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return CustomPaint(
                          painter: TimerPainterClassic(
                            text: timerString,
                            animation: controller,
                            backgroundColor: Colors.white,
                            color: Color.fromRGBO(Colors.greenAccent.red, Colors.greenAccent.green, Colors.greenAccent.blue, 1.0-(controller.value/2)),
//                          color: Colors.greenAccent.,

                          ));
                    },
//                    child: AnimatedBuilder(
//                      animation: controller,
//                      builder: (BuildContext context, Widget child) {
//                        return Text(
//                          timerString,
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 24.0,
//                              fontWeight: FontWeight.bold),
//                        );
//                      }
//                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width/4,
                  //color: new Color(0xffffc107),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.transparent,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return AnimatedDefaultTextStyle(
                              style: earnedCoin
                                  ? TextStyle(
                                  color: jadeColor,
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold)
                                  :
                              TextStyle(
                                  color: strawberryColor,
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold),
                              duration: const Duration(milliseconds: 500),
                              child: Text('$coins'));
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      'Valitse oikea käännös',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/11,
                    child: Text(
                      '$target',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width/20 > 35 ? 35:MediaQuery.of(context).size.width/20,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/11,
                    child: Text(
                      '$_playerAnswer',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: MediaQuery.of(context).size.width/20 > 35? 35:MediaQuery.of(context).size.width/20,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                    child: Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: List.unmodifiable(() sync* {
                        yield* _buildChoiceList();
                      }()),
                    )),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/11,
                    child: RaisedButton(
                        color: _nextButtonColor,
                        child: Text(
                          'Seuraava',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          print(_playerAnswer);
                          print(correctAnswer);
                          print(_playerAnswer ==correctAnswer);
                          String a = _playerAnswer.trim();
                          String b = correctAnswer.trim();
                          print(a==b);
                          if (a==b && controller.isAnimating){
                            _correctAnimation=true;
                            _nextButtonColor= Colors.greenAccent;
                            print('correct');

                            coins = coins +secondsLeft;
                            globals.totalPoints = globals.totalPoints +secondsLeft;
                            _speak(a);
                            _notifyDialog(context, '+ '+secondsLeft.toString(),'',1000);
                            controller.duration = Duration(seconds:secondsLeft + 10 >= 30? 30 :secondsLeft + 10 );
                            controller.reset();
                            controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value);
                            _loadNextQuestion();
                          } else if (a!=b && controller.isAnimating){

                            _nextButtonColor= Colors.redAccent;
                            coins = coins -1 <= 0 ? 0 :coins -1 ;
                            print('incorrect');
                            controller.duration = Duration(seconds: secondsLeft - 1 >=0 ? secondsLeft - 1:0);
                            controller.reset();
                            controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value);

                            playAudio('wrong.mp3');

                          } else if (a==b && !controller.isAnimating && _firstTime == 0){
                            _correctAnimation=true;
                            _nextButtonColor= Colors.greenAccent;
                            print('correct');
                            _introDialog(context,
                                "Aikasi loppui :D "+ globals.userName,
                                "Tällä kertaa teit: " + coins.toString() +
                                    " pistettä ");
                            _loadNextQuestion();
                            _firstTime = 1;
                          } else if (a==b && !controller.isAnimating && _firstTime == 1){

                            _correctAnimation=true;
                            _nextButtonColor= Colors.greenAccent;
                            print('correct');

                            coins = coins +secondsLeft;
                            globals.totalPoints = globals.totalPoints +secondsLeft;
                            _speak(a);
                            _notifyDialog(context, '+ '+secondsLeft.toString(),'',300);
                            _loadNextQuestion();
                            _firstTime = 0;
                            controller.duration = Duration(seconds: 22);
                            controller.reset();
                            controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value);

                          } else if (a!=b && !controller.isAnimating){
                            playAudio('wrong.mp3');

                            coins = coins -1 <= 0 ? 0 :coins -1 ;
                          }
                          setState(() {});
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
//                AnimatedCrossFade(
//                  secondChild: Container(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      //child: CircularProgressIndicator(),
//                    ),
//                    height: 40.0,
//                    width: 100.0,
//                  ),
//                  firstChild: Container(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(
//                        'Olet oikeassa!',
//                        style: TextStyle(
//                            backgroundColor: Colors.greenAccent,
//                            color: Colors.black,
//                            fontSize: 24.0,
//                            fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                    height: 80.0,
//                    width: 130.0,
//                  ), crossFadeState: _correctAnimation
//                    ? CrossFadeState.showFirst
//                    : CrossFadeState.showSecond,
//                  duration: Duration(milliseconds: 1500),
//                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void updateQuestion() {
    _playerAnswer="";
    var rng = new Random();
//    var l = new List.generate(4, (_) => rng.nextInt(4)+2);
//    var l = [2,3,4,5];


    String kar;
    kar = questions[(_questionNumber*2)-1][1];
    kar = kar + " " + questions[_questionNumber*2][1];
    correctAnswer = kar;
    target = questions[(_questionNumber*2)-1][0];
    target = target + " " + questions[_questionNumber*2][0];
    print(target.split(" "));
    var options = kar.split(" ");
    print(target);
    print(kar);
    var l = new List<int>.generate(options.length, (i) => i);
    l.shuffle();
    print(l);
    Map<String, int> aux = {
    };
    options.shuffle();
    options.asMap().forEach((index, value) => {
      aux[value] = index
    });

    print (aux);
    _choices = aux;

//    var map1 = Map.fromIterable(options, key: (e) => e, value: (e) => );
//    print(map1);
//    print("hey ey");
//    MapEntry
//    var result = { for ( var v in options) v[0]: v[1]};
//    print (result);
//    _choices= {
//      questions[_questionNumber][l.last]: l.removeLast() == 2
//          ? true
//          : false,
//      questions[_questionNumber][l.last]: l.removeLast() == 2
//          ? true
//          : false,
//      questions[_questionNumber][l.last]: l.removeLast() == 2
//          ? true
//          : false,
//      questions[_questionNumber][l.last]: l.removeLast() == 2
//          ? true
//          : false,
//    };

  }


  void _nameDialog (context,text, [content, int time=6000]) async{
    //print("base 64");
    //print(bytes);
    await showDialog<String>(
      barrierColor: Colors.white.withOpacity(0.9),
      barrierDismissible: false,
      context: context,
      builder: (context)
      {return Column(

          children: <Widget>[
//
//              Image.memory(bytes),
            new AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                "Tervetuloa Karjalan korttipeliin.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: jadeColor,
                    backgroundColor: Colors.transparent,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width / 15 <= 50.0 ? MediaQuery
                        .of(context)
                        .size
                        .width / 15 : 50.0,
                    fontWeight: FontWeight.bold),

              ),
              content: Text(
                "Vastaa niin moniin oikeisiin kysymyksiin, ennen kuin aika loppuu. Mennään !",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: blushColor,
                    backgroundColor: Colors.transparent,
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width / 20 <= 30.0 ? MediaQuery
                        .of(context)
                        .size
                        .width / 20 : 30.0,
                    fontWeight: FontWeight.bold),

              ),
            ),
            new Expanded(
                child: new Scaffold( body: TextFormField(
                  autofocus: true,
                  controller: _c,
                  decoration: new InputDecoration(
                      labelText: 'Sinun Lempinimesi', hintText: 'Sampo'),
                ),
                )),
            new FlatButton(
              child: new Text("Jatkaa"),
              onPressed: (){
                setState((){
                  globals.userName = _c.text;
                });
                //Navigator.maybePop(context);
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context, globals.userName);
                });
//                Navigator.pop(context, globals.userName);
              },
            )
          ]);
      },

    );
  }
}

void _notifyDialog(context, text, [ content, int time=3000]){
  //print("base 64");
  //print(bytes);

  showDialog(

      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.1) ,
      context: context,
      builder: (context)
      {
        Future.delayed(Duration(milliseconds: time), () {
          Navigator.of(context).pop(true);
        });
//        return Column(
//
//            children: <Widget>[
//
//              Image.memory(bytes),
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: jadeColor,
                backgroundColor: Colors.transparent,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width / 8 <= 80.0 ? MediaQuery
                    .of(context)
                    .size
                    .width / 8 : 80.0,
                fontWeight: FontWeight.bold),

          ),
          content: Text(
            content,
            style: TextStyle(
                color: jadeColor,
                backgroundColor: Colors.transparent,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width / 15 <= 30.0 ? MediaQuery
                    .of(context)
                    .size
                    .width / 15 : 30.0,
                fontWeight: FontWeight.bold),

          ),
        );
//            ]);
      });
}

void _introDialog(context, text, [content, int time=6000]){
  //print("base 64");
  //print(bytes);

  showDialog(
      barrierColor: Colors.white.withOpacity(0.9) ,
      context: context,
      builder: (context)
      {
        Future.delayed(Duration(milliseconds: time), () {
          Navigator.of(context).pop(true);
        });
//        return Column(
//
//            children: <Widget>[
//
//              Image.memory(bytes),
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: jadeColor,
                backgroundColor: Colors.transparent,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width / 15 <= 50.0 ? MediaQuery
                    .of(context)
                    .size
                    .width / 15 : 50.0,
                fontWeight: FontWeight.bold),

          ),
          content: Text(
            content,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: blushColor,
                backgroundColor: Colors.transparent,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width / 20 <= 30.0 ? MediaQuery
                    .of(context)
                    .size
                    .width / 20 : 30.0,
                fontWeight: FontWeight.bold),

          ),
        );
//            ]);
      });
}
