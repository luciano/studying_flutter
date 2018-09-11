import 'dart:convert' as json; // importing by name to avoid name conflicts
import 'package:meta/meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'serializers.dart';

part 'json_parsing.g.dart';

// after run: flutter packages pub run build_runner build
// use watch for changes get in the class fast
// flutter packages pub run build_runner watch
abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  @nullable
  bool get deleted;
  String get type;

  @nullable
  String get by;
  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  int get parent;

  @nullable
  int get poll;

  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  BuiltList<int> get parts;

  @nullable
  int get descendants;

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
  // using serialize
  final parsed = json.jsonDecode(jsonString);
  Article article = standardSerializaers.deserializeWith(Article.serializer, parsed);
  return article;

  // other way
  // throw UnimplementedError();
//  final parsed = json.jsonDecode(jsonString); // map of string
//  // make new constructor in the Article
//  Article article = Article.fromJson(parsed);
//  return article;
}