import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:quikka/core/models/quiz_category.dart';

class FirestoreService {
  final CollectionReference _quizCategoryCollectionReference =
      Firestore.instance.collection('quiz_category');

  Future getQuizCategory(String uid) async {
    try {
      var quizCategoryData =
          await _quizCategoryCollectionReference.document(uid).get();
      return QuizCategory.fromMap(quizCategoryData.data);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getQuizCategories() async {
    var quizCategoriesSnapshot =
        await _quizCategoryCollectionReference.getDocuments();

    if (quizCategoriesSnapshot.documents.isNotEmpty) {
      return quizCategoriesSnapshot.documents
          .map((document) => QuizCategory.fromMap(document.data))
          .where((mappedCategory) => mappedCategory.name != null)
          .toList();
    }
  }
}
