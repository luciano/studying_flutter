import 'dart:convert' as json; // importing by name to avoid name conflicts
import 'package:built_value/built_value.dart';

part 'json_parsing.g.dart';

// after run: flutter packages pub run build_runner build
// use watch for changes get in the class fast
// flutter packages pub run build_runner watch
abstract class Article implements Built<Article, ArticleBuilder> {
  int get id;

  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

// commenting everything to use the Built Value live template
//class Article {
//  final String text;
//  final String url;
//  final String by;
//  final int time;
//  final int score;
//
//  const Article({
//    this.text,
//    this.url,
//    this.by,
//    this.time,
//    this.score
//  });
//  //  Dart allows to do many constructors,
//  // factory constructor is basic a function
//  factory Article.fromJson(Map<String, dynamic> json) {
//  // method use as constructor
//    if (json == null) return null;
//
//    return Article(
//      text: json['text'] ?? '[null]',
//      url: json['url'],
//      by: json['by'],
//      time: json['time'],
//      score: json['score'],
//
//    ); //doesn't need use new keyword in the new Dart 2.0
//  }
//}

List<int> parseTopStories(String jsonString) {
  return [];
//  throw UnimplementedError();
  // use dart convert to convert string into a map with the fields of the json
//  final parsed = json.jsonDecode(jsonString); // make the parsed a map
//  final listOfIds = List<int>.from(parsed); // take the list of json, and use as a list
//  return listOfIds;
}

Article parseArticle(String jsonString) {
  return null;
  // throw UnimplementedError();
//  final parsed = json.jsonDecode(jsonString); // map of string
//  // make new constructor in the Article
//  Article article = Article.fromJson(parsed);
//  return article;
}