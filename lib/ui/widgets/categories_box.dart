import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quikka/core/constants/route_paths.dart';
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
        viewmodel.getCategories(limit: 3);
      },
      viewmodel: CategoryListViewModel(
        currentRoute: RoutePaths.HomeRoute,
        firestoreService: Provider.of(context),
      ),
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
                                          arguments: category.id,
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
