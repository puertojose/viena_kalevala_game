import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viena_kalevala_game/kalevala.dart';
import 'package:viena_kalevala_game/route.dart';
import 'package:viena_kalevala_game/search.dart';
import 'package:viena_kalevala_game/utils.dart';
import 'awards.dart';
import 'cardgame.dart';
import 'dart:convert';
import 'globals.dart' as globals;
import 'utils.dart' as utils;

//var _playerData = new PlayerData();
// some global place
final nPoints = new GlobalKey<_HomeState>();

Color jadeColor = Colors.teal;
Color jadeAccentColor = Colors.tealAccent;
Color poolColor = Color(0xff97CCD0);
Color strawberryColor = Color(0xffDD4835);
Color blushColor = Color(0xffEF8D81);

class Home extends StatefulWidget {
  const Home({ Key key}) : super(key: key);

  _HomeState createState() => _HomeState();

  static Route<dynamic> routeAnim() {
    return FadeRoute(
      name: '/home',
      title: 'Game On!',
      builder: (_) => Home(),
    );
  }

  static Route<dynamic> route() {
    return SimpleRoute(
      name: '/home',
      title: 'Game On!',
      builder: (_) => Home(),
    );
  }
}

//class PlayerData {
//  int points;
//
//  PlayerData() {
//    points = 0;
//  }
//
//  toJSONEncodable() {
//    return jsonEncode(points);
//  }
//}



class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _points;
  Future<String> _name;
  String _text = "initial";
  TextEditingController _c;

//  final LocalStorage storage = new LocalStorage('kalevala_points');
//  bool initialized = false;
//

  Future<void> incrementPoints() async {

    final SharedPreferences prefs = await _prefs;
    int points = globals.totalPoints;
    String name = (prefs.getString('userName') ?? 'asdasd');

    setState(() {
      _name = prefs.setString("userName", globals.userName).then((bool success) {
        return name;
      });
      _points = prefs.setInt("points", globals.totalPoints).then((bool success) {
        return points;
      });
    });
    return -1;
  }


  @override
  void initState() {

    _c = new TextEditingController();
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
//    _points = _prefs.then((SharedPreferences prefs) {
//      print("Hello Points");
//      print(prefs.getInt('points'));
//      print(prefs.getInt('points') ?? 0);
//      return (prefs.getInt('points') ?? 0);
//    }).then((value) => globals.totalPoints=value);
    _points = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('points') ?? 0);
    }).then((value) => globals.totalPoints=value);
    _name = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('userName') ?? 'Sampo');
    }).then((value) => globals.userName=value);
  }
//
//  _updatePoints(int nPoints) {
//    setState(() {
////      _playerData.points= _playerData.points + nPoints;
//
//    });
//  }



  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Kortit',
//      text: '',
      icon: Icon(Icons.contacts,
        color: Colors.greenAccent,
        size: 30.0,
      )
      ,
      iconMargin: EdgeInsets.all(1.0),
//      child: Text("hey")
    ),
    Tab(
        text: 'Kalevala',
//    text: '',
        icon: Icon(Icons.face,
          color: Colors.greenAccent,
          size: 30.0,
        )),
    Tab(
        text: 'Sanakirja',
//        text: '',
        icon: Icon(Icons.search,
          color: Colors.greenAccent,
          size: 30.0,
        )),
    Tab(
        text: 'Palkinto',
//        text: '',
        icon: Icon(Icons.star,
          color:Colors.greenAccent,
          size: 30.0,
        )),
  ];

  TabController _tabController;


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globals.userName+'    '+globals.totalPoints.toString()),
        backgroundColor: Colors.cyan,
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body:
      TabBarView(
        controller: _tabController,
        children:  myTabs.map((Tab tab) {
          if (tab.text == 'Kortit') {

            Utils();
            incrementPoints();
            return CardGame();
//          FutureBuilder(
//            future: storage.ready,
//            builder: (BuildContext context, AsyncSnapshot snapshot) {
//              if (snapshot.data == null) {
//                return CardGame();
//              } else {
////                _playerData = storage.getItem('kalevala_points');
//                return CardGame();
//              }
//            });

          }
          else if (tab.text == 'Sanakirja'){
            incrementPoints();
            return Search();
          } else if (tab.text == 'Palkinto'){
            incrementPoints();
            return Awards();
          } else if (tab.text == 'Kalevala'){
            incrementPoints();
            return Kalevala();
          }
          else {
            final String label = tab.text.toLowerCase();
            return Center(
                child: Chip(

                  label: Text(label),
                )

            );
          }
        }).toList(),
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
      barrierColor: Colors.white.withOpacity(0.9) ,
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Full Name', hintText: 'eg. John Smith'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('OPEN'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
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
                  'tyfytfytf',
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
                  'hgfhgf',
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
                child: new Scaffold( body: TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Full Name', hintText: 'eg. John Smith'),
                ),
              )),
              new FlatButton(
                child: new Text("Save"),
                onPressed: (){
                  setState((){
                    this._text = _c.text;
                    Navigator.pop(context, true);
                  });

                },
              )
            ]);
      },

    );
  }


}

