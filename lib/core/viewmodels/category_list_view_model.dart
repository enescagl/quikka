import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/services/firestore_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class CategoryListViewModel extends BaseViewModel {
  final String currentRoute;
  final FirestoreService firestoreService;

  CategoryListViewModel({this.currentRoute, this.firestoreService});

  List<QuizCategory> quizCategories;

  Future getCategories() async {
    busy = true;
    firestoreService.getQuizCategories().then((cats) {
      if (cats != null && cats is List<QuizCategory>) {
        quizCategories = cats;
      }
    });
    busy = false;
    notifyListeners();
    // getting categories logic comes here
  }
}
