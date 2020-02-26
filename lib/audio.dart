import 'package:viena_kalevala_game/audio.dart' // Stub implementation
if (dart.library.io) 'package:viena_kalevala_game/audio_noweb.dart' // dart:io implementation
if (dart.library.html) 'package:viena_kalevala_game/audio_web.dart'; // dart:html implementation

import 'package:flutter/foundation.dart';
import 'package:viena_kalevala_game/audio_noweb.dart';
import 'package:viena_kalevala_game/audio_web.dart';

void playAudio(String path){
  if (kIsWeb) {
    playAudio(path);
  }
  else{
    playAudio(path);
  }

}