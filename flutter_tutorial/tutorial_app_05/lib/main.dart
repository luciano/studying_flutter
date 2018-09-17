import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyTextInput()));

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {

  // control the text in a TextField
  final TextEditingController controller = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input text"), backgroundColor: Colors.deepOrange),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.text_fields, size: 90.0, color: Colors.deepOrangeAccent),
              TextField(
                decoration: InputDecoration(
                  hintText: "Type in here!"
                ),
                controller: controller,
                onChanged: (String txt) {// when change the TextField
                  setState(() {
                    //result = txt;
                  });
                },
                onSubmitted: (String txt) {// when submit text by tap enter
                  setState(() {
                    result += "\n" + txt;
                  });
                  controller.text = "";
                },
              ),
              Text(result, style: TextStyle(fontSize: 16.0))
            ],
          ),
        ),
      )
    );
  }
}
