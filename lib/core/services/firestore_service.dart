import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:quikka/core/models/question.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/services/data_service.dart';

class FirestoreService implements DataService {
  final CollectionReference _quizCategoryCollectionReference =
      Firestore.instance.collection('quiz_category');

  final CollectionReference _quizCollectionReference =
      Firestore.instance.collection('quiz');

  final CollectionReference _questionCollecitonReference =
      Firestore.instance.collection('quiz');
  @override
  Future getQuizCategory(String uid) async {
    try {
      var quizCategoryData =
          await _quizCategoryCollectionReference.document(uid).get();
      return QuizCategory.fromMap(quizCategoryData.data,
          uid: quizCategoryData.documentID);
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  @override
  Future<List<QuizCategory>> getCategories({int limit}) async {
    QuerySnapshot quizCategoriesSnapshot;
    if (limit != null) {
      quizCategoriesSnapshot =
          await _quizCategoryCollectionReference.limit(limit).getDocuments();
    } else {
      quizCategoriesSnapshot =
          await _quizCategoryCollectionReference.getDocuments();
    }

    if (quizCategoriesSnapshot.documents.isNotEmpty) {
      return quizCategoriesSnapshot.documents
          .map((document) =>
              QuizCategory.fromMap(document.data, uid: document.documentID))
          .where((mappedCategory) => mappedCategory.name != null)
          .toList();
    } else {
      return null;
    }
  }

  @override
  Future<List<Quiz>> getCategoryQuizes(String categoryUid) async {
    var quizSnapshot = await _quizCollectionReference
        .where('quizCategory', isEqualTo: categoryUid)
        .getDocuments();
    if (quizSnapshot.documents.isNotEmpty) {
      return quizSnapshot.documents
          .map((document) =>
              Quiz.fromMap(document.data, uid: document.documentID))
          .toList();
    } else {
      return null;
    }
  }

  @override
  Future<Quiz> getQuiz(String quizUid) async {
    var quizSnapshot = await _quizCollectionReference.document(quizUid).get();
    if (quizSnapshot.exists) {
      return Quiz.fromMap(quizSnapshot.data);
    } else {
      return null;
    }
  }

  @override
  Future<Question> getQuestion(String questionId) async {
    var questionSnapshot =
        await _questionCollecitonReference.document(questionId).get();
    if (questionSnapshot.exists) {
      return Question.fromMap(questionSnapshot.data);
    } else {
      return null;
    }
  }
}
