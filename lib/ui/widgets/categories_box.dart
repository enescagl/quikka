import 'package:flutter/material.dart';

import 'package:quikka/core/constants/route_paths.dart';
import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/viewmodels/category_list_view_model.dart';
import 'package:quikka/ui/shared/base_widget.dart';

class CategoriesBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CategoryListViewModel>(
      child: Text(
        'Categories',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      onViewModelReady: (viewmodel) {
        viewmodel.getCategories();
      },
      viewmodel: CategoryListViewModel(),
      builder: (context, viewmodel, child) => Padding(
        padding: const EdgeInsets.only(top: 56.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            child,
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: viewmodel.busy
                  ? Center(child: CircularProgressIndicator())
                  : Wrap(
                      spacing: 24.0,
                      runSpacing: 24.0,
                      children: [
                        ...viewmodel.quizCategories
                            // ...cats
                            .map(
                              (category) => Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: Border.all(
                                          width: 1, color: Colors.grey[400]),
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                    child: IconButton(
                                      iconSize: 36,
                                      icon: Icon(
                                        category.iconData,
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          RoutePaths.CategoryQuizListRoute,
                                          arguments: category.name,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      category.name,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                            .toList(),
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                    width: 1, color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: IconButton(
                                iconSize: 36,
                                icon: Icon(
                                  Icons.chevron_right,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.CategoryListRoute,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'View More',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

var cats = [
  QuizCategory(
    name: 'Sports',
    iconFamily: "MaterialIcons",
    iconCodePoint: Icons.adjust.codePoint,
  ),
  QuizCategory(
    name: 'Films',
    iconFamily: "MaterialIcons",
    iconCodePoint: Icons.movie.codePoint,
  ),
  QuizCategory(
    name: 'Technology',
    iconFamily: "MaterialIcons",
    iconCodePoint: Icons.ac_unit.codePoint,
  ),
  QuizCategory(
    name: 'Science',
    iconFamily: "MaterialIcons",
    iconCodePoint: Icons.accessible_forward.codePoint,
  ),
  QuizCategory(
    name: 'History',
    iconFamily: "MaterialIcons",
    iconCodePoint: Icons.account_balance.codePoint,
  ),
];
