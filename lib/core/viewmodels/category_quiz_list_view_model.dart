import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/models/quiz_preview.dart';
import 'package:quikka/core/services/firestore_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class CategoryQuizListViewModel extends BaseViewModel {
  final FirestoreService _firestoreService;

  List<QuizPreview> quizPreviews;
  QuizCategory category;

  CategoryQuizListViewModel({FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  Future getQuizPreviews(String categoryUid) async {
    busy = true;
    var quizes = await _firestoreService.getCategoryQuizes(categoryUid);
    quizes.forEach((quiz) {
      quizPreviews.add(QuizPreview(
        id: quiz.id,
        questionCount: quiz.questions.length,
        quiz: quiz,
        quizCategory: quiz.quizCategory,
      ));
    });
    busy = false;
  }

  Future getCategory(String categoryUid) async {
    busy = true;
    category = await _firestoreService.getQuizCategory(categoryUid);
    busy = false;
  }
}
