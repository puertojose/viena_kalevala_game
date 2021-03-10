import 'dart:convert';
//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dictionary.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Kirjoita tähän :)');
  Dictionary dictionary;
  bool isLoading= true;

  @override
  void initState() {
    super.initState();
    fetchDictionary().then((value) => isLoading = false);
  }

  Future<void> fetchDictionary() async {
    //var res = await http.get("https://opentdb.com/api.php?amount=20");
    //var decRes = jsonDecode("../web/assets/quiz.json");
    //print(decRes);
    //HtmlEscape htmlEscape = const HtmlEscape();
//    Map<String, dynamic> dmap = await parseJsonFromAssets("output.json");
//    Map<String, dynamic> dmap = await parseJsonFromAssets("dictionary.json");
    Map<String, dynamic> dmap = await parseJsonFromAssets("assets/output.json");
    dictionary = Dictionary.fromJson(dmap);


//    if (query.isEmpty) {
//      dictionary.displaySuggestions=true ;
//    } else {
//      dictionary.query = query;
//      dictionary.displaySuggestions=false ;
//      dictionary.displayWords = dictionary.entries;
//    }
  }

  @override
  Widget build(BuildContext context){

    if (isLoading){
      return Scaffold(
          body:Center(child: CircularProgressIndicator(),));
    }else
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.tealAccent,
//        actions: <Widget>[
//          IconButton(
//            onPressed: () {
//              showSearch(context: context, delegate: DataSearch());
////              setState(() {
////                if(this.cusIcon.icon == Icons.text_fields){
////                  this.cusIcon = Icon(Icons.cancel);
////                  this.cusSearchBar = TextField(
////                    style: TextStyle(
////                      color: Colors.white,
////                      fontSize: 16.0,
////                    ),
////                    textInputAction: TextInputAction.go,
////                    decoration: InputDecoration(
////                        border: InputBorder.none,
////                        hintText: "Kirjoita tähän :)",
////                    ),
////                  );
////                }
////                else {
////                  this.cusIcon = Icon(Icons.text_fields);
////                  this.cusSearchBar = Text('Kirjoita tähän :)');
////                }
////              });
//
//            },
//            icon: cusIcon,
//          )
//        ],
//        title: cusSearchBar,
//
//      ),
//      body: RefreshIndicator(
//        onRefresh: fetchDictionary,
//        child: FutureBuilder(
//            future: fetchDictionary(),
//            builder: (BuildContext context, AsyncSnapshot snapshot) {
//              switch (snapshot.connectionState) {
//                case ConnectionState.none:
//                  return Text('Press button to start.');
//                case ConnectionState.active:
//                case ConnectionState.waiting:
//                  return Center(
//                    child: CircularProgressIndicator(),
//                  );
//                case ConnectionState.done:
//                if (snapshot.hasError) return null;
//              }
//              return null;
//            }),
//      ),
    body: Center(
        child : GestureDetector(
          onTap:() {
            showSearch(context: context, delegate: DataSearch(dictionary));
          },
        child:Image.asset('assets/book.jpg', height: MediaQuery.of(context).size.height,)
      ))
    );

  }
}


class DataSearch extends SearchDelegate<String> {
  Dictionary dictionary;
  DataSearch(this.dictionary, {
    String hintText,
  }): super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: null,
  );


  //Dictionary dictionary;

//  File jsonFile;
//  Directory dir;
//  String fileName = "myJSONFile.json";
//  bool fileExists = false;
//  Map<String, String> fileContent;
//
//  void createFile(Map<String, String> content, Directory dir, String fileName) {
//    print("Creating file!");
//    File file = new File(dir.path + "/" + fileName);
//    file.createSync();
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
  Future<void> fetchDictionary() async {
    //var res = await http.get("https://opentdb.com/api.php?amount=20");
    //var decRes = jsonDecode("../web/assets/quiz.json");
    //print(decRes);
    //HtmlEscape htmlEscape = const HtmlEscape();
//    Map<String, dynamic> dmap = await parseJsonFromAssets("output.json");
//    Map<String, dynamic> dmap = await parseJsonFromAssets("dictionary.json");
    Map<String, dynamic> dmap = await parseJsonFromAssets("assets/output.json");
    dictionary = Dictionary.fromJson(dmap);


//    if (query.isEmpty) {
//      dictionary.displaySuggestions=true ;
//    } else {
//      dictionary.query = query;
//      dictionary.displaySuggestions=false ;
//      dictionary.displayWords = dictionary.entries;
//    }
  }
 @override
  // TODO: implement textInputAction
  TextInputAction get textInputAction => super.textInputAction;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      showResults(context);
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

//  @override
//  Widget buildResults(BuildContext context) {
//    return FutureBuilder(
//        future: fetchDictionary(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.none:
//              return Text('Press button to start.');
//            case ConnectionState.active:
//            case ConnectionState.waiting:
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            case ConnectionState.done:
//              if (snapshot.hasError) return null;
//              return ListView.builder(
////                itemCount: dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase()) || w.definition.startsWith(query.toLowerCase())).toList().length > 30 ? 30 : dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase()) || w.definition.startsWith(query.toLowerCase())).toList().length ,
////                itemCount: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length ,
//                itemCount: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length > 15 ? 15 : dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length,
//                itemBuilder: (context, index) => Card(
//                  color: Colors.white,
//                  elevation: 0.0,
//                  child: ExpansionTile(
//                    title: Padding(
//                      padding: const EdgeInsets.all(18.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Text(
//                              dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].word,
//                              style: TextStyle(
//                                fontSize: 20.0,
//                                fontWeight: FontWeight.bold,
//
//                              ),
////                              toolbarOptions: ToolbarOptions(
////                                  copy: true,
////                                  selectAll: true)
//                          ),
//                          Text(
//                              dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].definition,
//                              style: TextStyle(
//                                fontSize: 22.0,
//                                fontWeight: FontWeight.normal,
//                              ),
////                              toolbarOptions: ToolbarOptions(
////                                  copy: true,
////                                  selectAll: true)
//                          ),
//                        ],
//                      ),
//                    ),
//                    leading: CircleAvatar(
//                      backgroundColor: Colors.grey[100],
//                      child: Text( dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].word.substring(0,2),
//                      style: TextStyle(color: Colors.cyan)),
//                    ),
//                    children: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].examples.map((m) {
//                      return ListTile(
//
//                        focusColor: Colors.cyan,
//                        title: Text(
//                          m.toString(),
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                            color: Colors.cyan,
//                            fontWeight: FontWeight.bold,
//                          ),
////                            toolbarOptions: ToolbarOptions(
////                                copy: true,
////                                selectAll: true)
//                        ),
//                      );
//                    }).toList(),
//                  ),
//                ),
//              );
//          }
//          return Container();
//        });
//  }

  @override
  Widget buildResults(BuildContext context) {

//
//    Future.delayed(Duration(milliseconds: 1000), () {
//                    return Center(
//                child: CircularProgressIndicator(),
//              );
//    }).then((value){
  var a = dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length > 8 ? 8 : dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length;
    return ListView.builder(
//                itemCount: dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase()) || w.definition.startsWith(query.toLowerCase())).toList().length > 30 ? 30 : dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase()) || w.definition.startsWith(query.toLowerCase())).toList().length ,
//                itemCount: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length ,
        itemCount: a,
    itemBuilder: (context, index) => Card(
          color: Colors.white,
          elevation: 0.0,
          child: ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].word,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
//                              toolbarOptions: ToolbarOptions(
//                                  copy: true,
//                                  selectAll: true)
                  ),
                  Text(
                    dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].definition,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.normal,
                    ),
//                              toolbarOptions: ToolbarOptions(
//                                  copy: true,
//                                  selectAll: true)
                  ),
                ],
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Text( dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].word.substring(0,2),
                  style: TextStyle(color: Colors.cyan)),
            ),
            children: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList()[index].examples.map((m) {
              return ListTile(

                focusColor: Colors.cyan,
                title: Text(
                  m.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                  ),
//                            toolbarOptions: ToolbarOptions(
//                                copy: true,
//                                selectAll: true)
                ),
              );
            }).toList(),
          ),
        ),
      );
    //              return Center(
//                child: CircularProgressIndicator(),
//              );

          }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // TODO: implement buildSuggestions
  //   return Container();
  // }


 @override
 Widget buildSuggestions(BuildContext context) {
   return FutureBuilder(
       future: fetchDictionary(),
       builder: (BuildContext context, AsyncSnapshot snapshot) {
         switch (snapshot.connectionState) {
           case ConnectionState.none:
             return Text('Press button to start.');
           case ConnectionState.active:
           case ConnectionState.waiting:
             return Center(
               child: CircularProgressIndicator(),
             );
           case ConnectionState.done:
             if (snapshot.hasError) return null;
             return ListView.builder(
//                itemCount: dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase())).toList().length > 15 ? 15 : dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase())).toList().length ,
               itemCount: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length > 15 ? 15 : dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length,
               itemBuilder: (context, index) => Card(
                 color: Colors.white,
                 elevation: 0.0,
                 child: ExpansionTile(
                   title: Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         Text(
                           dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].word,
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,

                           ),
//                            toolbarOptions: ToolbarOptions(
//                              copy: true,
//                              selectAll: true)
                         ),
                         Text(
                           dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].definition,
                           style: TextStyle(
                             fontSize: 22.0,
                             fontWeight: FontWeight.normal,
                           ),
//                              toolbarOptions: ToolbarOptions(
//                                  copy: true,
//                                  selectAll: true)
                         ),
                       ],
                     ),
                   ),
                   leading: CircleAvatar(
                     backgroundColor: Colors.grey[100],
                     child: Text(dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].word.substring(0,2),style: TextStyle(color: Colors.cyan),),
                   ),
                   children: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].examples.map((m) {
                     return ListTile(
                       focusColor: Colors.cyan,
                       title: Text(
                         m.toString(),
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: Colors.cyan,
                           fontWeight: FontWeight.bold,
                         ),
//                            toolbarOptions: ToolbarOptions(
//                                copy: true,
//                                selectAll: true)
                       ),
                     );
                   }).toList(),
                 ),
               ),
             );
         }
         return Container();
         });
//    return ListView.builder(itemBuilder: (context, index) => ListTile(
//      leading: Icon(Icons.location_city),
//      title: Text(suggestionList[index]),
//    ))
 }

//  @override
//  Widget buildSuggestions(BuildContext context) {
////    return Container(
////      child: Text(
////        "press enter"
////      )
////    );
////  }
//var a = dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length > 8 ? 8 : dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase()) || w.word.startsWith(query.toLowerCase())).toList().length;
//              return ListView.builder(
////                itemCount: dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase())).toList().length > 15 ? 15 : dictionary.entries.where((w)=> w.word.startsWith(query.toLowerCase())).toList().length ,
//                itemCount: a,
//                itemBuilder: (context, index) => Card(
//                  color: Colors.white,
//                  elevation: 0.0,
//                  child: ExpansionTile(
//                    title: Padding(
//                      padding: const EdgeInsets.all(18.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Text(
//                            dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].word,
//                            style: TextStyle(
//                              fontSize: 20.0,
//                              fontWeight: FontWeight.bold,
//
//                            ),
////                            toolbarOptions: ToolbarOptions(
////                              copy: true,
////                              selectAll: true)
//                          ),
//                          Text(
//                            dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].definition,
//                            style: TextStyle(
//                              fontSize: 22.0,
//                              fontWeight: FontWeight.normal,
//                            ),
////                              toolbarOptions: ToolbarOptions(
////                                  copy: true,
////                                  selectAll: true)
//                          ),
//                        ],
//                      ),
//                    ),
//                    leading: CircleAvatar(
//                      backgroundColor: Colors.grey[100],
//                      child: Text(dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].word.substring(0,2),style: TextStyle(color: Colors.cyan),),
//                    ),
//                    children: dictionary.entries.where((w)=> w.definition.startsWith(query.toLowerCase())|| w.word.startsWith(query.toLowerCase())).toList()[index].examples.map((m) {
//                      return ListTile(
//                        focusColor: Colors.cyan,
//                        title: Text(
//                          m.toString(),
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                            color: Colors.cyan,
//                            fontWeight: FontWeight.bold,
//                          ),
////                            toolbarOptions: ToolbarOptions(
////                                copy: true,
////                                selectAll: true)
//                        ),
//                      );
//                    }).toList(),
//                  ),
//                ),
//              );
//          }

//    return ListView.builder(itemBuilder: (context, index) => ListTile(
//      leading: Icon(Icons.location_city),
//      title: Text(suggestionList[index]),
//    ))

}

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  //print('--- Parse json from: $assetsPath');
  return rootBundle.loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

