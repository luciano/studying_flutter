import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;

void main() => runApp(MaterialApp(home: MyTabs()));

class MyTabs extends StatefulWidget {

  @override
  MyTabsState createState() => MyTabsState();
}

// use it to navigate with animation
class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  // controller control the tap view
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pages"),
        backgroundColor: Colors.deepOrange,
        bottom: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.arrow_forward)),
            Tab(icon: Icon(Icons.arrow_downward)),
            Tab(icon: Icon(Icons.arrow_back)),
          ]
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.deepOrange,
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.arrow_forward)),
            Tab(icon: Icon(Icons.arrow_downward)),
            Tab(icon: Icon(Icons.arrow_back)),
          ]
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          first.First(),
          second.Second(),
          third.Third()
        ]
      ),
    );
  }
}