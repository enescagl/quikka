import 'package:quikka/core/models/question.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/services/firestore_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class QuizViewModel extends BaseViewModel {
  final FirestoreService _firestoreService;

  QuizViewModel({FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  List<Question> questions;

  Future getQuestions(Quiz quiz) async {
    busy = true;
    quiz = await _firestoreService.getQuiz(quiz.id.toString());

    busy = false;
  }
}
