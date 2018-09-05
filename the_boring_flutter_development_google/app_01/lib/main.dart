import 'dart:async';

import 'package:flutter/material.dart';
import 'src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp()); // run the main widget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles; // from the file

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new RefreshIndicator(
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1));
          //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("REFRESHED")));
          setState(() { // makes sure flutter knows something changes
            _articles.removeAt(0);
          });
          return;
        },
        child: new ListView(
            children: _articles.map(_buildItem).toList(),
        ),
      ),
    );
  }
}

Widget _buildItem(Article article) {
  return new Padding(
    padding: const EdgeInsets.all(16.0),
    child: new ExpansionTile(title: new Text(article.text, style: new TextStyle(fontSize: 24.0),),
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("${article.commentsCount} comments"),
            new IconButton(
              icon: new Icon(Icons.launch),
              onPressed: ()async {
                final fakeURL = "http://${article.domain}";
                // give a Future the canLaunch, so need the async to wait for the response
                if (await canLaunch(fakeURL)) {
                  launch(fakeURL); // return Future
                }
              },
            )
          ],
        )
      ],
    ),
  );
}
