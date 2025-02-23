import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/models/quiz_preview.dart';
import 'package:quikka/core/services/data_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class CategoryQuizListViewModel extends BaseViewModel {
  final DataService _dataService;

  List<QuizPreview> quizPreviews = [];
  QuizCategory category;

  CategoryQuizListViewModel({DataService dataService})
      : _dataService = dataService;

  Future getQuizPreviews(String categoryUid) async {
    busy = true;
    var quizes = await _dataService.getCategoryQuizes(categoryUid);
    await getCategory(categoryUid);
    if (quizes != null) {
      quizes.forEach((quiz) {
        quizPreviews.add(QuizPreview(
          questionCount: quiz.questionIds.length,
          id: quiz.id,
          quiz: quiz,
          quizCategory: category,
        ));
      });
    }
    busy = false;
  }

  Future getCategory(String categoryUid) async {
    busy = true;
    category = await _dataService.getQuizCategory(categoryUid);
    busy = false;
  }
}
