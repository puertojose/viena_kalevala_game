import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'dart:math';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Kalevala extends StatefulWidget {
  @override
  _KalevalaState createState() => _KalevalaState();
}

class _KalevalaState extends State<Kalevala> {
  int _questionNumber = 1;
  int _correctPosition = -1;
  bool _correctAnimation = false;
  Color _nextButtonColor =Colors.white;

  String _playerAnswer = "";


  List<List<dynamic>> questions;

  @override
  void initState() {
    _getThingsOnStartup().then((value){
      print('Async done');
    });
    super.initState();
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
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(option),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
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
    Future.delayed(const Duration(milliseconds: 1000), () {
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
            width: 380,
            height: 400,
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
                      'Kysymys $_questionNumber',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
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
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      '$_playerAnswer',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20.0,
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
                          print(_playerAnswer);
                          print(correctAnswer);
                          print(_playerAnswer ==correctAnswer);
                          String a = _playerAnswer.trim();
                          String b = correctAnswer.trim();
                          print(a==b);
                          if (a==b){

                            _correctAnimation=true;
                            _nextButtonColor= Colors.greenAccent;
                            print('correct');

                            _loadNextQuestion();
                          } else {
                            _nextButtonColor= Colors.redAccent;
                            print('incorrect');
                          }
                          setState(() {});
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                AnimatedCrossFade(
                  secondChild: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //child: CircularProgressIndicator(),
                    ),
                    height: 40.0,
                    width: 100.0,
                  ),
                  firstChild: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Olet oikeassa!',
                        style: TextStyle(
                            backgroundColor: Colors.greenAccent,
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: 80.0,
                    width: 130.0,
                  ), crossFadeState: _correctAnimation
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1500),
                )
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
    kar = questions[_questionNumber][1];
    correctAnswer = kar;
    target = questions[_questionNumber][0];
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
}