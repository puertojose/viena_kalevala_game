import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:viena_kalevala_game/audio_noweb.dart' // Stub implementation
if (dart.library.html) 'package:viena_kalevala_game/audio_web.dart'; // dart:html implementation

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Awards extends StatefulWidget {
  @override
  _AwardsState createState() => _AwardsState();

}

class _AwardsState extends State<Awards> {
  @override
  Widget build(BuildContext context) {
    final title = 'Awards';

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
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/aino.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Aino'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/aino.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
              photo: 'assets/characters/ilmarinen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Ilmarinen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/ilmarinen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
              photo: 'assets/characters/joukahainen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Joukahainen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/joukahainen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/kullervo.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Kullervo'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/kullervo.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
              photo: 'assets/characters/kyllikki.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Kyllikki'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/kyllikki.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/lemminkainen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Lemminkainen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/lemminkainen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/lemminkaisenaiti.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Lemminkaisenaiti'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/lemminkaisenaiti.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/louhi.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Louhi'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/louhi.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/marjatta.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Marjatta'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/marjatta.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/pohjolantyttaret.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Pohjolantyttaret'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/pohjolantyttaret.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/sampo.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Sampo'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/sampo.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/vainamoinen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Vainamoinen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: PhotoHero(
                            photo: 'assets/characters/vainamoinen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                        ),
                      );
                    }
                ));
              },
            ),


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

//  void playAudio(String path) {
//    if(kIsWeb) {
//      js.context.callMethod('playAudio', [path]);
//    }
//    else {
//      playLocal(path);
//    }
//  }
//  playLocal(String path) async {
//    int result = await audioPlayer.play(path, isLocal: true);
//  }
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.text, this.photo, this.onTap, this.width }) : super(key: key);

  final String text;
  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
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