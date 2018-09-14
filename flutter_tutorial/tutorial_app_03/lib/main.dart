import 'package:flutter/material.dart';

/*
*  Stateful Widgets and Buttons:
*
* We can manipulate and change the states to rerender the widgets
*
* Tapping button to change the state of the Text widget
* */

void main() => runApp(MaterialApp(home: AwesomeButton()));

class AwesomeButton extends StatefulWidget {

  @override
  AwesomeButtonState createState() => AwesomeButtonState();
}

class AwesomeButtonState extends State<AwesomeButton> {

  int counter = 0;
  List<String> strings = ['Flutter', 'is', 'interesting!'];
  String displayedString = "Press the button";

  // can be done the following as well to create variables
//  var counter = 0
//  var strings = ['Flutter', 'is', 'interesting!'];

  // when press the button change the states and update the screen
  void onPressed() {
    setState(() {
      displayedString = strings[counter];
      counter = counter < 2 ? counter + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Widget"), backgroundColor: Colors.deepOrange,),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(displayedString,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                child: Text("Press me!",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0
                  ),
                ),
                color: Colors.red,
                onPressed: onPressed, // put null in onPressed makes the button deactivated
              )
            ],
          ),
        ),
      ),
    );
  }
}