import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viena_kalevala_game/utils.dart';
import 'package:csv/csv.dart';
import 'dart:math';

import 'dart:html' as html;

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {


  html.AudioElement audio;

  List<List<dynamic>> questions;

  @override
  void initState() {
    _getThingsOnStartup().then((value){
      print('Async done');
    });
    super.initState();
  }
  Future _getThingsOnStartup() async {
    await loadAsset('cardgame.csv').then((dynamic output) {
      var csvRaw = output;
//      print(csvRaw);
      List<List<dynamic>> csvTable = CsvToListConverter().convert(output);
      questions = csvTable;
      print(questions);
    });
  }
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }


  AnimationController controller;
  int duration = 1000 * 30;
  int durationBackup;

  var coins = 0;

  var bosses = Utils.getBosses();
  var bossIndex = 0;

  var level = 1;

  var earnedCoin = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
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

  Widget earnedCoins() {
    if (earnedCoin) {
      return Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Text(
          "+20",
          style: Utils.textStyle(45.0, color: Colors.green),
          
        ),
      );
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
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
            width: 330,
            height: 391,
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
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Kysymys $_questionNumber  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width/4,
                  //color: new Color(0xffffc107),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: setColorProgress(coins),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '$coins',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
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
                    child: Text(
                      '$target',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 42.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Container(
                    child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: List.unmodifiable(() sync* {
                    yield* _buildChoiceList();
                  }()),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Container(

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

                          if (this._correctAnswer == true) {
                            _correctAnimation=true;
                            _nextButtonColor= Colors.greenAccent;
                            print('correct');
                            earnedCoin = true;
                            coins = coins +20;
                            _loadNextQuestion();
                          } else {
                            _nextButtonColor= Colors.redAccent;
                            earnedCoin = false;
                            print('incorrect');
                          }
                          setState(() {});
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),

                ),

//
//                Image.asset(
//                  "coin.jpeg",
//                  height: 12.2,
//                ),

                AnimatedCrossFade(
                  secondChild: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //child: CircularProgressIndicator(),
                    ),
                    height: 40.0,
                    width: 100.0,
                  ),
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
//
//                    height: 80.0,
//                    width: 130.0,
//                  ),
                  firstChild:  earnedCoins(),
                  crossFadeState: _correctAnimation
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1500),
                )
                ,
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
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(option),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Colors.greenAccent,
          selected: _selectedChoice == option,
          onSelected: (selected) {
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

