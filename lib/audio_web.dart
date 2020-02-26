
import 'package:flutter/foundation.dart';
import 'dart:js' as js;


  void playAudio(String path) {
    print("web audio called");
    if (kIsWeb) {
      js.context.callMethod('playAudio', ["assets/"+path]);
    }
  }


