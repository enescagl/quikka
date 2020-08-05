import 'package:quikka/core/models/question.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/models/quiz_answers.dart';
import 'package:quikka/core/models/quiz_category.dart';

abstract class DataService {
  Future getQuizCategory(String uid);
  Future<List<QuizCategory>> getCategories();
  Future<Quiz> getQuiz(String quizUid);
  Future<List<Quiz>> getCategoryQuizes(String categoryUid);
  Future<Question> getQuestion(String questionId);
  Future<String> createQuizAnswers(QuizAnswer quizAnswer);
}
