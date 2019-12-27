//import 'dart:convert';
//import 'dart:io';
//import 'package:universal_html/html.dart';
//import 'package:web_socket_channel/io.dart' as io;
//import 'package:path_provider/path_provider.dart';
class Dictionary {

  //String _definition;
  List<Entry> entries;
  List<Entry> displayWords;
  bool displaySuggestions = true;
  String query;
//
//  File jsonFile;
//  Directory dir;
//  String fileName = "myJSONFile.json";
//  bool fileExists = false;
//  Map<String, String> fileContent;
//
//
//  void createFile(Map<String, String> content, Directory dir, String fileName) {
//    print("Creating file!");
//    File file = new File(dir.path + "/" + fileName);
//    fileExists = true;
//    file.writeAsStringSync(json.encode(content));
//  }
//
//  void writeToFile(String key, String value) {
//    print("Writing to file!");
//    Map<String, String> content = {key: value};
//    if (fileExists) {
//      print("File exists");
//      Map<String, String> jsonFileContent = json.decode(jsonFile.readAsStringSync());
//      jsonFileContent.addAll(content);
//      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
//    } else {
//      print("File does not exist!");
//      createFile(content, dir, fileName);
//    }
//  }
//
//  Dictionary({this.entries,this.displayWords,this.displaySuggestions=true,this.query});
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.entries != null) {
//      data['Entries'] = this.entries.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }

//  Dictionary.fromJson(Map<String, dynamic> json) {
//    //if(json['_identifier']!= null){ entries.add(value)}
//      if (json['DictionaryEntry'] != null) {
//        entries = List<Entry>();
//        json['DictionaryEntry'].forEach((v) {
////          entries.add(Entry.fromJson(v));
//          if (v['SenseGrp'] != null) {
//            entries.add(Entry.fromJson2(v));
//          }
//          else if (v['HeadwordCtn']!= null){
//            entries.add(Entry.fromJson1(v));
//          }
//        });
//        if(displaySuggestions) {
//          displayWords = entries.sublist(0, 20);
//        }
//        else {
//          displayWords = entries.where((w)=> w.word.startsWith(query)).toList();
//        }
//        }
////      createFile(toJson(), dir, fileName);
//  }


  Dictionary.fromJson(Map<String, dynamic> json) {
      entries = List<Entry>();
      json.keys.forEach((f){
//        print(i);
        entries.add(Entry.fromJson(json[f],f));
      });
      if(displaySuggestions) {
        displayWords = entries.sublist(0, 20);
      }
        else {
          displayWords = entries.where((w)=> w.word.startsWith(query)).toList();
        }
  }

//    //if(json['_identifier']!= null){ entries.add(value)}
//    if (json['DictionaryEntry'] != null) {
//      entries = List<Entry>();
//      json['DictionaryEntry'].forEach((v) {
////          entries.add(Entry.fromJson(v));
//        if (v['SenseGrp'] != null) {
//          entries.add(Entry.fromJson2(v));
//        }
//        else if (v['HeadwordCtn']!= null){
//          entries.add(Entry.fromJson1(v));
//        }
//      });
//      if(displaySuggestions) {
//        displayWords = entries.sublist(0, 20);
//      }
//      else {
//        displayWords = entries.where((w)=> w.entry.startsWith(query)).toList();
//      }
//    }
////      createFile(toJson(), dir, fileName);
//  }
}


//
//class Entry {
//  int key;
//  String word;
//  List<Definitions> definitions;
//
//  Entry({
//    this.key,
//    this.word,
//    this.definitions
//  });
//
//  Entry.fromJson1(Map<String, dynamic> json) {
//    word = json['_identifier'];
//    if (json['HeadwordCtn'] != null) {
//      definitions = new List<Definitions>();
//      //definitions.add(Definitions());
//      definitions.add(Definitions.fromJson(json['HeadwordCtn']));
//    }}
//
//
//  Entry.fromJson2(Map<String, dynamic> json) {
//    word = json['_identifier'];
//    if (json['SenseGrp'] != null) {
//      definitions = new List<Definitions>();
//      //definitions.add(Definitions());
//      json['SenseGrp'].forEach((d) {
//        definitions.add(new Definitions.fromJson(d));
//      });
//    }
//  }
//
//  Entry.fromJson(Map<String, dynamic> json) {
//    word = json["_identifier"];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['identifier'] = this.word;
//    data['definitions']  = this.definitions.map((v) => v.toJson()).toList();
//    return data;
//  }
//}

class Entry {
  String word;
  String definition;
  List<String> examples;

  Entry(String w, String d, List<String> e) {
    this.word = w;
    this.definition = d;
    this.examples = e;
  }

  Entry.fromJson(Map<String, dynamic> json, String w) {
//    print(w);
    word = w;
//    print(json['definition']);
//    print(json['examples']);
    definition = json['definition'].toString();
    examples = new List<String>();
    json['examples'].forEach((d) {
      if(d.toString() is String) {
//        print(d.toString());
//        print(d is String);
//        print(examples);
        this.examples.add(d.toString());
      }
      });
//    print(json);
  }
}

class Definitions {
  String definition;
  List<Examples> examples;

  Definitions({
    this.definition ='not found',
    this.examples
  });

  Definitions.fromJson(Map<String, dynamic> json) {
    if(json['Definition']!=''){
//      print(json['Definition']=='');
//      print(json['Definition'].toString());
//      print(json['Definition'].toString().substring(0,3));
//      print(json['Definition']!=null && json['Definition'].toString().substring(0,3)=="{Se");
      if(json['Definition']!=null && json['Definition'].toString().substring(0,3)=="{Se"){

        Map<String, dynamic> aux = json['Definition'];
        Map<String, dynamic> aux2 = aux['SeeAlso'];
        Map<String, dynamic> aux3 = aux2['Ptr'];
        definition = aux3['__text'];
//        print(aux3['__text']);

      } else if (json['Definition']!=null && json['Definition'].toString().substring(0,3)=="{Ra"){
        Map<String, dynamic> aux = json['Definition'];
        definition = aux['__text'];
      }
      else if(json['Definition']!=null && json['Definition'] is String) {
        definition = json['Definition'].toString();
      }


    } else {
      definition = "not found";


    }


      //print(definition);
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this.definition;
    data['examples'] = this.examples.map((v) => v.toJson()).toList();
    return data;
  }
//    if(json['ExampleBlock'] != null ){
//      examples = new List<Examples>();
//      print("Newwwwwwww");
////      json['ExampleBlock'].forEach((e){
////        //examples.add(new Examples.fromJson(e));
////      });
//    }

}

class Examples {
  List<String> list;

  Examples({
    this.list
  });

  Examples.fromJson(Map<String, dynamic> json) {
    if(json['ExampleCtn']!=null) {
      list = new List<String>();
      json['ExampleCtn'].forEach((s){
        //list.add(stringFromJson(s));
      });

  }
  }

  String stringFromJson(Map<String, dynamic> json) {
    if(json['Example']['Fragment']!=null){
      return json['Example']['Fragment'] as String;
    }
    else {return "";}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examples'] = this.list;
    return data;
  }
}
