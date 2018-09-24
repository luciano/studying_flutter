import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert' as json;
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  TextEditingController keyInputController = TextEditingController();
  TextEditingController valueInputController = TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "myJSONfile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent = {};


  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      // will be executed only after the function return something
      dir = directory;
      jsonFile = File(dir.path + "/" + fileName); // path of the documents directory
      fileExists = jsonFile.existsSync();
      if (fileExists) { // when in Production use the exists because is async
        this.setState(() => fileContent = json.jsonDecode(jsonFile.readAsStringSync()));
      }
    }); // return Future
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file");
    File file = File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.jsonEncode(content));
  }

  void writeToFile(String key, String value) {
    print("Writing to file!");
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.jsonDecode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.jsonEncode(jsonFileContent));
    } else {
      print("File does not exitsts");
      createFile(content, dir, fileName);
    }

    this.setState(() => fileContent = json.jsonDecode(jsonFile.readAsStringSync()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JSON Tutorial")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text("File content: ", style: TextStyle(fontWeight:  FontWeight.bold)),
          Text(fileContent.toString()),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text("Add to JSON file:"),
          TextField(
            controller: keyInputController,
          ),
          TextField(
            controller: valueInputController,
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          RaisedButton(
            child: Text("Add key, value pair"),
            onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
    );
  }
}