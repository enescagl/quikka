import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/services/firestore_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class CategoryListViewModel extends BaseViewModel {
  final String currentRoute;
  final FirestoreService _firestoreService;

  CategoryListViewModel({this.currentRoute, FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  List<QuizCategory> quizCategories;

  Future getCategories({int limit}) async {
    busy = true;
    quizCategories = await _firestoreService.getCategories(limit: limit);

    busy = false;
    // getting categories logic comes here
  }
}
