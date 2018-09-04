import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// The main method uses fat arrow (=>) notation, Use fat arrow notation for one-line functions or methods.
void main() => runApp(new MyApp());

// The app extends StatelessWidget, which makes the app itself a widget.
// Stateless widgets are immutable, meaning that their properties can't change—all values are final.
// Stateful widgets maintain state that might change during the lifetime of the widget.
// Implementing a stateful widget requires at least two classes:
// 1) a StatefulWidget class that creates an instance of 2) a State class.
// The StatefulWidget class is, itself, immutable,
// but the State class persists over the lifetime of the widget.
class MyApp extends StatelessWidget {
  // A widget's main job is to provide a build method that describes
  // how to display the widget in terms of other, lower-level widgets.
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random(); // removed into the method
    return new MaterialApp(
      //title: 'Welcome to Flutter',
      // The Scaffold widget, from the Material library, provides a default
      // app bar, a title, and a body property that holds the widget tree for the home screen.
      /*
       home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: const Text('Hello World'),
          //child: new Text(wordPair.asPascalCase), // removed into the method
          child: new RandomWords(),
        ),
      ),
    */
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  // Tip: Prefixing an identifier with an underscore enforces privacy in the Dart language.
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggestFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // The itemBuilder callback is called once per suggested
      // word pairing, and places each suggestion into a ListTile
      // row. For even rows, the function adds a ListTile row for
      // the word pairing. For odd rows, the function adds a
      // Divider widget to visually separate the entries. Note that
      // the divider may be difficult to see on smaller devices.
      itemBuilder: (BuildContext _context, int i) {
        // Add a one-pixel-high divider widget before each row
        // in the ListView.
        if (i.isOdd) {
          return new Divider();
        }

        // The syntax "i ~/ 2" divides i by 2 and returns an
        // integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings
        // in the ListView,minus the divider widgets.
        final int index = i ~/ 2;

        // If you've reached the end of the available word pairings...
        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggestFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null
      ),
      onTap: () {
        setState(() { // call this function to notify the framework that state has changed
          // triggers call to build() resulting in a update of UI
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggestFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

// The RandomWords widget does little else besides creating its State class
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
