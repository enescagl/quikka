import 'package:flutter/material.dart';
import 'package:quikka/core/constants/route_paths.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/models/quiz_answers.dart';
import 'package:quikka/ui/views/category_list_view.dart';
import 'package:quikka/ui/views/category_quiz_list_view.dart';
import 'package:quikka/ui/views/home_view.dart';
import 'package:quikka/ui/views/leaderboard_view.dart';
import 'package:quikka/ui/views/quiz_view.dart';
import 'package:quikka/ui/views/result_view.dart';
import 'package:quikka/ui/views/route_not_found_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.HomeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      case RoutePaths.CategoryListRoute:
        return MaterialPageRoute(
          builder: (_) => CategoryListView(),
        );

      case RoutePaths.LeaderBoardRoute:
        return MaterialPageRoute(
          builder: (_) => LeaderboardView(),
        );

      case RoutePaths.QuizRoute:
        var quiz = settings.arguments as Quiz;
        return MaterialPageRoute(
          builder: (_) => QuizView(
            quiz: quiz,
          ),
        );

      case RoutePaths.CategoryQuizListRoute:
        var categoryUid = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => CategoryQuizListView(
            categoryUid: categoryUid,
          ),
        );

      case RoutePaths.ResultRoute:
        var quizAnswers = settings.arguments as QuizAnswers;
        return MaterialPageRoute(
          builder: (_) => ResultView(
            quizAnswers: quizAnswers,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => RouteNotFoundView());
    }
  }
}
