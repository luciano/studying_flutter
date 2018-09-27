import 'package:flutter/material.dart';

import 'category_route.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(),
    );
  }
}

// Draw a rectangle
//void main() => runApp(MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Hello Rectangle"),
//        ),
//        body: HelloRectangle(),
//      ),
//    ));
//
//class HelloRectangle extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Container(
//        color: Colors.greenAccent,
//        height: 400.0,
//        width: 300.0,
//        child: Center(
//          child: Text("Hello!",
//              textAlign: TextAlign.center,
//              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)
//          ),
//        ),
//      ),
//    );
//  }
//}
