import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:viena_kalevala_game/kalevala.dart';
import 'package:viena_kalevala_game/route.dart';
import 'package:viena_kalevala_game/search.dart';
import 'package:viena_kalevala_game/utils.dart';
import 'awards.dart';
import 'cardgame.dart';
import 'dart:convert';

//var _playerData = new PlayerData();

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
  final LocalStorage storage = new LocalStorage('kalevala_points');
  bool initialized = false;

  _updatePoints(int nPoints) {
    setState(() {
//      _playerData.points= _playerData.points + nPoints;
      _saveToStorage();
    });
  }

  _saveToStorage() {
//    storage.setItem('kalevala_points', _playerData.toJSONEncodable());
  }


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
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(_playerData.points.toString()),
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
            return Search();
          } else if (tab.text == 'Palkinto'){
            return Awards();
          } else if (tab.text == 'Kalevala'){
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
}