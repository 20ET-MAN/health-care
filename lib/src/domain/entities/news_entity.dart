import 'package:cloud_firestore/cloud_firestore.dart';

class NewsEntity {
  final String author;
  final String contentBottom;
  final String contentCenter;
  final String contentTop;
  final String description;
  final String thumbnailBottom;
  final String thumbnailCenter;
  final String thumbnailTop;
  final String title;

  NewsEntity(
      {required this.author,
      required this.contentBottom,
      required this.contentCenter,
      required this.contentTop,
      required this.description,
      required this.thumbnailBottom,
      required this.thumbnailCenter,
      required this.thumbnailTop,
      required this.title});

  factory NewsEntity.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      NewsEntity(
          author: json['author'],
          contentBottom: json['contentBottom'],
          contentCenter: json['contentCenter'],
          contentTop: json['contentTop'],
          description: json['description'],
          thumbnailBottom: json['thumbnailBottom'],
          thumbnailCenter: json['thumbnailCenter'],
          thumbnailTop: json['thumbnailTop'],
          title: json['title']);
}
