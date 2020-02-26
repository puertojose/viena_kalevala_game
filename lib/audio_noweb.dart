

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);


  void playAudio(String path) {
    print("No web audio called");
    loadMusic(path);
  }

Future loadMusic(path) async {
  audioPlayer = await AudioCache().play(path).then((value) =>   audioPlayer = null);
}

  playLocal(String path) async {
    int result = await audioPlayer.play(path, isLocal: true);
    print("Audio problem ?");
    print(result);
  }





