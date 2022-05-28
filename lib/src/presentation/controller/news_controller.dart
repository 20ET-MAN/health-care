import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthcare/src/domain/entities/news_entity.dart';

class NewsController {
  Future<List<NewsEntity>> getNews() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('News').limit(7).get();
    final newsData = snapshot.docs
        .map((docSnapshot) => NewsEntity.fromDocumentSnapshot(docSnapshot))
        .toList();
    return newsData;
  }
}
