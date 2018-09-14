import 'package:flutter/material.dart';

/*
* Stateless Widget
*
* We can't change the states, nothing is updated in the widgets
*
* MaterialApp is a group of widgets with standard material look
*
* Scaffold is a widget some sort of layouts, provides appBar and body of the app
*
* Container there is the functionality of padding
*
* */

void main() {
  runApp(MaterialApp(
    home: MyStatelessWidget(),
  ));
}

class MyStatelessWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateless Widget"),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ // can put many widget as children
            MyCard(
              title: Text("I love Flutter",
                style: TextStyle(
                  fontSize: 25.0
                )
              ),
              icon: Icon(Icons.favorite, size: 40.0, color: Colors.redAccent),
            ),
            MyCard(
              title: Text("I love donuts",
                style: TextStyle(
                    fontSize: 25.0
                )
              ),
              icon: Icon(Icons.donut_large, size: 40.0, color: Colors.brown),
            ),
            MyCard(
              title: Text("I see you",
                style: TextStyle(
                    fontSize: 25.0
                )
              ),
              icon: Icon(Icons.visibility, size: 40.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  // creating constructor
  MyCard({this.title, this.icon});

  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              this.title,
              this.icon
            ],
          ),
        ),
      ),
    );
  }
}