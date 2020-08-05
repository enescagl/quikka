import 'package:quikka/core/models/question.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/models/quiz_answers.dart';
import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/services/data_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class QuizViewModel extends BaseViewModel {
  final DataService _dataService;

  QuizViewModel({DataService dataService}) : _dataService = dataService;

  List<Question> questions = [];
  QuizCategory quizCategory;

  Future getQuestions(Quiz quiz) async {
    busy = true;
    quiz.questionIds.forEach((id) async {
      var question = await _dataService.getQuestion(id);
      questions.add(question);
    });

    busy = false;
  }

  Future getCategory(String categoryId) async {
    busy = true;
    quizCategory = await _dataService.getQuizCategory(categoryId);
    busy = false;
  }

  Future<String> sendAnswerSelection(
      Quiz quiz, List<Map<String, String>> selectedOptions) async {
    var quizAnswer =
        QuizAnswer(questionAnswers: selectedOptions, quizId: quiz.id);
    var answersId = await _dataService.createQuizAnswers(quizAnswer);
    return answersId;
  }
}
