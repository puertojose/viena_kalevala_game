import 'package:flutter/material.dart';
import 'package:viena_kalevala_game/kalevala.dart';
import 'package:viena_kalevala_game/route.dart';
import 'package:viena_kalevala_game/search.dart';
import 'package:viena_kalevala_game/utils.dart';
import 'awards.dart';
import 'cardgame.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);
  @override
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {


  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Kortit',
        icon: Icon(Icons.contacts,
          color: Colors.green,
          size: 30.0,
        )),
    Tab(text: 'Kalevala',
        icon: Icon(Icons.face,
      color: Colors.green,
      size: 30.0,
    )),
    Tab(text: 'Sanakirja',
        icon: Icon(Icons.search,
          color: Colors.green,
          size: 30.0,
        )),
    Tab(text: 'Palkinto',
        icon: Icon(Icons.star,
          color: Colors.green,
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
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          if (tab.text == 'Kortit') {
            return CardGame();
          }
          else if (tab.text == 'Sanakirja'){
            return Search();
//            return SliverAppBar(
//              floating: true,
//              snap: true,
//              title: Text("Search App"),
//              actions: <Widget>[
//                IconButton(
//                  icon: Icon(Icons.search),
//                  onPressed: () {
//                    showSearch(
//                      context: context,
//                      delegate: CustomSearchDelegate(),
//                    );
//                  },
//                ),
//              ],
//            );
          } else if (tab.text == 'Palkinto'){
            return Awards();
          } else if (tab.text == 'Kalevala'){
            return Kalevala();
          }


          else {
          final String label = tab.text.toLowerCase();
          return Center(
            child: Chip(
//              avatar: CircleAvatar(
//                backgroundColor: Colors.grey.shad  e800,
//                child: Text('AB'),
//              ),
              label: Text(label),
            )
//            child: Text(
//              'This is the $label tab',
//              style: const TextStyle(fontSize: 36),
//
//            ),
          );
          }
        }).toList(),
      ),
    );
  }
}