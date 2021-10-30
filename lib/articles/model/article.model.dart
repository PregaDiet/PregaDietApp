import 'dart:convert';

class Article {
  final String title;
  final String context;
  final String imageUrl;
  Article({
    required this.title,
    required this.context,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'context': context,
      'imageUrl': imageUrl,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      context: map['context'],
      imageUrl: map['imageUrl'],
    );
  }
}
