import 'package:flutter/material.dart';

void main() {
  runApp(
    Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr, // left to right
          child: Text("Hello World")
        )
      ),
    )
  );
}