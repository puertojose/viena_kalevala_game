import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viena_kalevala_game/home.dart';
import 'package:viena_kalevala_game/timer_animation.dart';
import 'package:viena_kalevala_game/utils.dart';
import 'package:csv/csv.dart';
import 'dart:math';
//import 'package:quiver/async.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'globals.dart' as globals;



import 'package:viena_kalevala_game/audio_noweb.dart' // Stub implementation
if (dart.library.html) 'package:viena_kalevala_game/audio_web.dart'; // dart:html implementation

//import 'dart:html' as html;

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Color jadeColor = Color(0xff5C9487);
Color jadeColor = Colors.teal;
Color jadeAccentColor = Colors.tealAccent;
Color poolColor = Color(0xff97CCD0);
Color strawberryColor = Color(0xffDD4835);
Color blushColor = Color(0xffEF8D81);


class CardGame extends StatefulWidget {
  const CardGame({Key key}) : super(key: key);

  @override
  _CardGameState createState() => _CardGameState();

}

enum TtsState { playing, stopped }

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


class _CardGameState extends State<CardGame> with TickerProviderStateMixin {



  final _c = TextEditingController();


//
//
//  StreamSubscription streamSubscription;



  //Jade #5C9487
  //Pool #97CCD0
  //Strawberry #DD4835
  //Blush #EF8D81

// To handle Dialogs context

  final LocalStorage storage = new LocalStorage('kalevala_points');

  List<List<dynamic>> questions;
  FlutterTts flutterTts = FlutterTts();
  var ttsState;
  Future _speak(text) async{
    String karelian = convertToKarelianPhonetic(text);
    var result = await flutterTts.speak(karelian);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

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


  @override
  void initState() {
//    streamSubscription = widget.shouldTriggerChange.listen((_) => _loadNextQuestion());
    _getThingsOnStartup().then((value){
      //startTimer(13,13);
      print('Async done');

      if(globals.userName=='Sampo'){
        _nameDialog(context, 'sdas');
      } else _introDialog(_scaffoldKey.currentContext, "Tervetuloa Karjalan korttipeliin.",
          "Vastaa niin moniin oikeisiin kysymyksiin, ennen kuin aika loppuu. Mennään !");
    });
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

//  @override
//  didUpdateWidget(CardGame old) {
//    super.didUpdateWidget(old);
//    // in case the stream instance changed, subscribe to the new one
//    if (widget.shouldTriggerChange != old.shouldTriggerChange) {
//      streamSubscription.cancel();
//      streamSubscription = widget.shouldTriggerChange.listen((_) => _loadNextQuestion());
//    }
//  }
  @override
  dispose() {
    super.dispose();
  }
//
//  List<String> list = List();
//  Uint8List bytes;
//  Future _getData() async {
//
//    print("WEB IMAGEEEE");
//    var response = await http.get('https://www.google.com/search?q=%22+karhu+%22&source=lnms&tbm=isch&sa=X');
//    print(response.statusCode);
//    if (response.statusCode == 200){
//      print("response");
//      dom.Document document = parser.parse(response.body);
//
//      final elements = document.getElementsByTagName('img');
////      final elements = document.getElementsByClassName('islrc');
////      print(elements[0].firstChild.firstChild);
//      setState(() {
//        print(elements[0].attributes['src'].substring(22));
//        bytes = base64.decode(elements[0].attributes['src'].substring(22));
//      });
////        list = elements
////            .map((element) =>
////        element.attributes['src'])
////            .toList();
//
//      print("WEB IMAGEEEE2");
//      print(list);
//      print(list.length);
//
//
//    }
//
//
//
////    FutureBuilder<String>(
////        element.getElementsByTagName("img")[0].attributes['src'])
////    );
//
//  }

  Future _getThingsOnStartup() async {
    await loadAsset('assets/cardgame.csv').then((dynamic output) {
      var csvRaw = output;
//      print(csvRaw);
      List<List<dynamic>> csvTable = CsvToListConverter().convert(output);
      questions = csvTable;
      print(questions);
    });
    await flutterTts.setLanguage("fi-FI");
  }
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  int duration = 1000 * 30;
  int durationBackup;



  var coins = 0;

//  var bosses = Utils.getBosses();
  var bossIndex = 0;

  var level = 1;
  var _firstTime =1;

  var earnedCoin = false;
  var _start=45;
  var _current=45;
  var aux = 10;
  //CountdownTimer countDownTimer;

  void startTimer(time,current) {
    _current = current;
//    countDownTimer = new CountdownTimer(
//      new Duration(seconds: time),
//      new Duration(seconds: 1),
//    );

//    var sub = countDownTimer.listen(null);
//    sub.onData((duration) {
//      setState(() {
//        _current = time - duration.elapsed.inSeconds;
//      });
//    });

//    sub.onDone(() {
//      print("Done");
//      sub.cancel();
//    });
  }



  int _questionNumber = 1;
  bool _correctAnswer = false;
  bool _correctAnimation = false;
  Color _nextButtonColor =Colors.white;

  set correctAnswer(bool ans) {
    _correctAnswer = ans;
  }


  String target = 'oraškuu';
  var _choices = {'toukokuu': true, 'helmikuu': false, 'heinäkuu': false, 'marraskuu': false, };



  Widget coinVisibility(bool bought) {
    if (bought) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Image.asset(
          "coin.jpeg",
          width: 13,
          height: 13,
        ),
      );
    }
  }
//
//  Widget earnedCoins() {
//    if (earnedCoin) {
//      return Padding(
//        padding: const EdgeInsets.only(left: 0.0),
//        child: Text(
//          "+1",
//          style: Utils.textStyle(45.0, color: poolColor),
//
//        ),
//      );
//    } else {
//      return Container(
//        width: 0.0,
//        height: 0.0,
//      );
//    }
//  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: poolColor,
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
                    color: blushColor,
                  ),
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return CustomPaint(
                          painter: TimerPainter(
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
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      'Kysymys $_questionNumber  ',
//                      style: TextStyle(
//                          color: Colors.black,
//                          fontSize: 24.0,
//                          fontWeight: FontWeight.bold),
//                    ),
//                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width/4,
                  //color: new Color(0xffffc107),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
//                    color: setColorProgress(coins),
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
                    height: MediaQuery.of(context).size.height/10,
                    child: Text(
                      '$target',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width/10 > 65 ? 65:MediaQuery.of(context).size.width/10,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                    alignment: AlignmentDirectional.topCenter,
                    height: MediaQuery.of(context).size.height/6,
                    child: Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: List.unmodifiable(() sync* {
                        yield* _buildChoiceList();
                      }()),
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom:20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/12,
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
                          if (controller.isAnimating) {

                            if (this._correctAnswer == true) {

//                            //countDownTimer.cancel();
//                            if(coins<10) {
//                            }
//                            else controller.duration = Duration(seconds:10);

                              _correctAnimation=true;
                              _nextButtonColor= jadeColor;
                              print('correct');
                              earnedCoin = true;
                              coins = coins +secondsLeft;
                              globals.totalPoints = globals.totalPoints +secondsLeft;
                              _notifyDialog(context, '+ '+secondsLeft.toString(),'',300);
                              _loadNextQuestion();
//                            controller.reverse(
//                                from: controller.value == 0.0
//                                    ? 1.0
//                                    : controller.value);

                              //controller.value((secondsLeft + 3));
//                            controller.reverse(
//                                from: controller.value == 0.0
//                                    ? 1.0
//                                    : controller.value);
                              print("secondsLeft: " );
                              print(secondsLeft);
                              print("secondsLeft: " );
                              print(secondsLeft);
                              controller.duration = Duration(seconds:secondsLeft + 5 >= 15? 15 :secondsLeft + 5 );
                              controller.reset();
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);
                              playAudio('test.mp3');
                            } else {
                              _nextButtonColor= strawberryColor;
                              earnedCoin = false;
                              coins = coins -1 <= 0 ? 0 :coins -1 ;
                              print('incorrect');
                              controller.duration = Duration(seconds: secondsLeft - 1 >=0 ? secondsLeft - 1:0);
                              controller.reset();
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);

                              playAudio('wrong.mp3');
                            }

                            //controller.stop(canceled: true);
                          } else {
                            if (this._correctAnswer == true && _firstTime == 0) {
                              _correctAnimation = true;
                              //_nextButtonColor= Colors.greenAccent;
//                            print('correct');
//                            earnedCoin = true;
//                            coins = coins + secondsLeft;
//                            _notifyDialog(context, '+ '+secondsLeft.toString(),'',300);
                              _loadNextQuestion();
                              _introDialog(_scaffoldKey.currentContext,
                                  "Aikasi loppui :D "+ globals.userName,
                                  "Tällä kertaa teit: " + coins.toString() +
                                      " pistettä ");
//                            if(coins<10) startTimer(coins,coins);
//                            else startTimer(10,10);
                              coins = 0;
//                              controller.duration = Duration(seconds: 10);
//                              controller.reset();
//                              controller.reverse(
//                                  from: controller.value == 0.0
//                                      ? 1.0
//                                      : controller.value);

                              playAudio('test.mp3');
                              _firstTime = 1;

                            } else if (this._correctAnswer == true && _firstTime == 1) {
                              _notifyDialog(context, '+ '+secondsLeft.toString(),'',300);
                              _nextButtonColor = poolColor;
                              _correctAnimation = true;
                              _nextButtonColor = poolColor;
                              print('correct');
                              earnedCoin = true;
                              coins = coins + secondsLeft;
                              _loadNextQuestion();
                              controller.duration = Duration(seconds: 10);
                              controller.reset();
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);

                              playAudio('test.mp3');
                              _firstTime = 0;
                            } else if (this._correctAnswer == false &&
                                _firstTime == 1) {
                              _nextButtonColor = strawberryColor;
                              earnedCoin = false;
//                              coins = coins - 1 <= 0 ? 0 : coins - 1;
//                              print('incorrect');
//                              controller.duration = Duration(
//                                  seconds: secondsLeft - 1 >= 0 ? secondsLeft -
//                                      1 : 0);
//                              controller.reset();
//                              controller.reverse(
//                                  from: controller.value == 0.0
//                                      ? 1.0
//                                      : controller.value);
                              playAudio('wrong.mp3');
                            } else {
                              _introDialog(_scaffoldKey.currentContext,
                                  "Aikasi loppui :D "+ globals.userName,
                                  "Tällä kertaa teit: " + coins.toString() +
                                      " pistettä ");
//                            if(coins<10) startTimer(coins,coins);
//                            else startTimer(10,10);
                              coins = 0;
                              _firstTime = 1;
                            }


//
//
//
//                          if (this._correctAnswer == true && _current >0) {
//
//                            countDownTimer.cancel();
//                            if(coins<10) startTimer(coins,coins);
//                            else startTimer(10,10);
//                            playAudio('test.mp3');
//
//                            _correctAnimation=true;
//                            _nextButtonColor= Colors.greenAccent;
//                            print('correct');
//                            earnedCoin = true;
//                            coins = coins +1;
//                            _loadNextQuestion();
//                          } else if (_current >0){
//                            _nextButtonColor= Colors.redAccent;
//                            earnedCoin = false;
//                            print('incorrect');
//                          } else if (this._correctAnswer == true && _current <=0){
//                            _correctAnimation=true;
//                            _nextButtonColor= Colors.greenAccent;
//                            print('correct');
//                            earnedCoin = true;
//                            coins = coins +1;
//                            _loadNextQuestion();
//                            _openCustomDialog(context, "Your time ran out :D ", "this time you made: " +coins.toString()+" points ");
////                            if(coins<10) startTimer(coins,coins);
////                            else startTimer(10,10);
//                            _current = 10;
//                          }
//                          else{
//                            _openCustomDialog(context, "Your time ran out :D ", "this time you made: " +coins.toString()+" points ");
////                            if(coins<10) startTimer(coins,coins);
////                            else startTimer(10,10);
//                            _current = 10;
//                          }
//                          setState(() {});
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),

                ),
//                FutureBuilder<int>(
//                  future: incrementPoints(coins),
//                    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                      switch (snapshot.connectionState) {
//                        case ConnectionState.waiting:
//                          return const CircularProgressIndicator();
//                        default:
//                          if (snapshot.hasError) {
//                            return Text('Error: ${snapshot.error}');
//                          } else {
//                            return Text(
//                              'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
//                                  'This should persist across restarts.',
//                            );
//                          }
//                      }
//                    }
//                ),
//
//                Image.asset(
//                  "coin.jpeg",
//                  height: 12.2,
//                ),

//                AnimatedCrossFade(
//                  secondChild: Container(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      //child: CircularProgressIndicator(),
//                    ),
//                    height: 40.0,
//                    width: 100.0,
//                  ),
////                  firstChild: Container(
////                    child: Padding(
////                      padding: const EdgeInsets.all(8.0),
////                      child: Text(
////                        'Olet oikeassa!',
////                        style: TextStyle(
////                            backgroundColor: Colors.greenAccent,
////                            color: Colors.black,
////                            fontSize: 24.0,
////                            fontWeight: FontWeight.bold),
////                      ),
////                    ),
////
////                    height: 80.0,
////                    width: 130.0,
////                  ),
////                  firstChild:  earnedCoins(),
//                  crossFadeState: _correctAnimation
//                      ? CrossFadeState.showFirst
//                      : CrossFadeState.showSecond,
//                  duration: Duration(milliseconds: 1500),
//                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//  refresh(bool k) {
//    setState(() {
//      _correctAnswer = k;
//    });
//  }

  String _selectedChoice="";

  _buildChoiceList() {
    List<Widget> choices = List();
    _choices.forEach((option,k){
      choices.add(Container(
//        height: MediaQuery.of(context).size.height/18,
        padding: const EdgeInsets.all(1.0),
        child: ChoiceChip(
          label: Text(option),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: MediaQuery.of(context).size.width/27 > 27? 27:MediaQuery.of(context).size.width/27, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white12,
          selectedColor: poolColor,
          selected: _selectedChoice == option,
          onSelected: (selected) {
            _speak(option);
            setState(() {
              _selectedChoice = option;
              _correctAnswer=k;
//              widget.notifyParent(k);
            });
          },
        ),
      ));
    });
    return choices;
  }

  void _loadNextQuestion() {
//    _getData().then((value){
//
//      print("WEB IMAGEEEE3");
//    } );
    _correctAnswer=false;
    Future.delayed(const Duration(milliseconds: 400), () {
      _correctAnimation=false;


      setState(() {
        _questionNumber++;
        updateQuestion();
//        target = 'šyyškuu';
//        _choices = {'toukokuu': false, 'syyskuu': true, 'heinäkuu': false, 'marraskuu': false, };
        _nextButtonColor =Colors.white;
      });

    });
  }

  setColorProgress(int coins) {
//    if(coins <= 20) return Colors.white;
//    else if (coins >=20 && coins <=40) return Colors.greenAccent;
//    else return Colors.green;
    return Color.fromRGBO(0, 1+ (coins/10).round()%254, 0, 0.1);
  }

  void updateQuestion() {
    var rng = new Random();
//    var l = new List.generate(4, (_) => rng.nextInt(4)+2);
    var l = [2,3,4,5];
    l.shuffle();
    print(l);
    target = questions[_questionNumber][1];
    _choices= {
      questions[_questionNumber][l.last]: l.removeLast() == 2
          ? true
          : false,
      questions[_questionNumber][l.last]: l.removeLast() == 2
          ? true
          : false,
      questions[_questionNumber][l.last]: l.removeLast() == 2
          ? true
          : false,
      questions[_questionNumber][l.last]: l.removeLast() == 2
          ? true
          : false,
    };

  }


  void _notifyDialog(context, text, [content, int time=3000]){
    //print("base 64");
    //print(bytes);

    showDialog(

        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.3) ,
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

                Navigator.pop(context, globals.userName);
              },
            )
          ]);
      },

    );
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
}

//class choiceChipWidget extends StatefulWidget {
//  final Map<String, bool> options;
//  final Function(bool k) notifyParent;
//
//  choiceChipWidget(this.options, {Key key, @required this.notifyParent})
//      : super(key: key);
//
//  @override
//  _choiceChipWidgetState createState() => _choiceChipWidgetState();
//}
//
//class _choiceChipWidgetState extends State<choiceChipWidget> {
//  String _selectedChoice = "";
//
//  String get selectedChoice => _selectedChoice;
//  bool _correct = false;
//
//  bool get correct => _correct;
//
//  _buildChoiceList() {
//    List<Widget> choices = List();
//    widget.options.forEach((option, k) {
//      choices.add(Container(
//        padding: const EdgeInsets.all(2.0),
//        child: ChoiceChip(
//          label: Text(option),
//          labelStyle: TextStyle(
//              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(30.0),
//          ),
//          backgroundColor: Color(0xffededed),
//          selectedColor: Colors.greenAccent,
//          selected: _selectedChoice == option,
//          onSelected: (selected) {
//            setState(() {
//              _selectedChoice = option;
//              widget.notifyParent(k);
//            });
//          },
//        ),
//      ));
//    });
//    return choices;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Wrap(
//      children: _buildChoiceList(),
//    );
//  }




void _openCustomDialog(BuildContext context, title, content) {
  showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
//        Future.delayed(Duration(seconds:1), (){
//          Navigator.of(context).pop(true);
//        });
//        Transform.scale(
//          scale: a1.value,
//          child: Opacity(
//            opacity: a1.value,
        return AlertDialog(
          backgroundColor: Color.fromRGBO(255, 255, 255,60.0),
          contentPadding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/4, MediaQuery.of(context).size.height/4, MediaQuery.of(context).size.width/4, MediaQuery.of(context).size.height/4),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0)),
          title: Text(title),
          content: Text(content),
        );
//          ),
//        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

