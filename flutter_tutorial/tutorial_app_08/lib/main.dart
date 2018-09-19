import 'dart:async'; // use async functions
import 'dart:convert' as json; // convert json to list

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  // will be async
  // Future will return a string in the future when the function return something
  // await: wait until got the data
  Future<String> getData() async {
    // the type of the var will be http.Response
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: { // using token or key to access the api
//        "key": "there the key"
        "Accept": "application/json" //just accept json files
      }
    );

    print(response.body);

    // rerender list view
    this.setState(() {
      data = json.jsonDecode(response.body);
    });

    return "Success";
  }

  @override
  void initState() {
    // it's called before any thing gets render in the screen
    this.getData();
    super.initState();
  }

  // ListView.builder() -> if have a lot of data, it tries to speed up the user experience
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView with JSON Request"),),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text(data[index]["title"])),
                  Divider(),
                  Text(data[index]["body"])
                ],
              ),
            ),
          );
        },
      )
//      Center(
//        child: RaisedButton(
//          child: Text("Get Data"),
//          onPressed: getData,
//        ),
//      ),
    );
  }
}