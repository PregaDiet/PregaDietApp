import 'package:cloud_firestore/cloud_firestore.dart';

import '../../common/firebase_constats.dart';
import '../model/article.model.dart';

class ArticleRepository {
  ArticleRepository({required this.firestore});
  final FirebaseFirestore firestore;

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];

    final querySnapshot = await firestore.collection(CPath.articles).get();

    for (final snap in querySnapshot.docs) {
      articles.add(Article.fromMap(snap.data()));
    }

    return articles;
  }
}
