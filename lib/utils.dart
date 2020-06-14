import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'powerups.dart';
import 'bosses.dart';
import 'globals.dart' as globals;

class Utils extends StatefulWidget{

  @override
  _UtilsState createState() => _UtilsState();


}


class _UtilsState extends State<Utils>{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _points;
  Future<String> _name;

  @override
  Widget build(BuildContext context) {
    return loadData(context);
  }

  @override
  void initState() {
    super.initState();
    _points = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('points') ?? 0);
    }).then((value) => globals.totalPoints=value);
    _name = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('userName') ?? 'Sampo');
    }).then((value) => globals.userName=value);
//    _getThingsOnStartup();

  }

  @override
  dispose() {
    super.dispose();
  }

  Future _getThingsOnStartup() async {
    _prefs.then((prefs) =>
        globals.totalPoints = prefs.getInt('points')
        );
    _prefs.then((prefs) =>
        globals.userName = prefs.getString('userName')
    );
  }


  Widget loadData(BuildContext context) {
    return Stack(
        children: <Widget>[
          FutureBuilder<int>(
              future: _points,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Tervetuloa takaisin',
                      );
                    }
                }
              }),
          FutureBuilder<String>(
              future: _name,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        ' l' ,
                      );
                    }
                }
              })
        ]);
  }
}


class StrokeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final String fontFamily;

  const StrokeText(
      this.text, {
        Key key,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.strokeColor,
        this.strokeWidth,
        this.fontFamily
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            color: color,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            foreground: Paint()
              ..strokeWidth = strokeWidth
              ..color = strokeColor
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 20.0);

    var firstControlPoint = Offset(size.width / 4, 0.0);
    var firstEndPoint = Offset(size.width / 2.25, 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 3.25), 65.0);
    var secondEndPoint = Offset(size.width, size.height - 40.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 40.0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
