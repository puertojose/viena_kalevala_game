import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Awards extends StatefulWidget {
  @override
  _AwardsState createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: <Widget>[
            Hero(
              tag: 'aino',
              child: Image.asset('characters/aino.png'),
            )
          ],
//          children: List.generate(12, (index) {
//            return Center(
//              child: Image.asset('characters2/'+index.toString()+'.png'),
////              child: Text(
////                'Item $index',
////                style: Theme.of(context).textTheme.headline,
////              ),
//            );
//            onTap () =>
//          }),
        ),
      ),
    );
  }

}

class characterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    child: {
      Hero(
        tag: 'aino',
        child: Image.asset('characters/aino.png'),
      );
    }
  }
}