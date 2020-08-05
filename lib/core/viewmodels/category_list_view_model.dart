import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/services/data_service.dart';
import 'package:quikka/core/services/firestore_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class CategoryListViewModel extends BaseViewModel {
  final String currentRoute;
  final FirestoreService _dataService;

  CategoryListViewModel({this.currentRoute, DataService dataService})
      : _dataService = dataService;

  List<QuizCategory> quizCategories;

  Future getCategories({int limit}) async {
    busy = true;
    quizCategories = await _dataService.getCategories(limit: limit);

    busy = false;
    // getting categories logic comes here
  }
}
