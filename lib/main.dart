import 'package:flutter/material.dart';
import 'package:viena_kalevala_game/welcome.dart';

//import 'game.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

     // builder: (context, widget) => ResponsiveWrapper.builder(
     //   ResponsiveWrapper(
     //       maxWidth: 1200,
     //       minWidth: 480,
     //       defaultScale: true,
     //       breakpoints: [
     //         ResponsiveBreakpoint.resize(480, name: MOBILE),
     //         ResponsiveBreakpoint.autoScale(800, name: TABLET),
     //         ResponsiveBreakpoint.resize(1000, name: DESKTOP),
     //       ],
     //       background: Container(color: Color(0xFFF5F5F5))
     //   )
     // ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch(settings.name) {
          //case "/": return Welcome.route();
          case "/home": return Home.route();
//          case "/privacy": return Game.route();
//          case "/support": return Support.route();
//          case "/download": return Download.route();
          default: return Welcome.route();
        }
      },

      initialRoute: "home",
//      routes: {
//        '/': (_) => Welcome(),
//        '/game': (_) => Game(),
//        '/download': (_) => Download(),
//        '/privacy': (_) => Privacy(),
//      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (choose the "Toggle Debug Paint" action
          // from the Flutter Inspector in Android Studio, or the "Toggle Debug
          // Paint" command in Visual Studio Code) to see the wireframe for each
          // widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
