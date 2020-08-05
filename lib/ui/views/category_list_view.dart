import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikka/core/constants/route_paths.dart';
import 'package:quikka/core/models/quiz_category.dart';
import 'package:quikka/core/viewmodels/category_list_view_model.dart';
import 'package:quikka/ui/shared/base_widget.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CategoryListViewModel>(
      viewmodel: CategoryListViewModel(
        currentRoute: RoutePaths.CategoryListRoute,
        dataService: Provider.of(context),
      ),
      onViewModelReady: (viewmodel) {
        viewmodel.getCategories();
      },
      child: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.grey[900],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
        centerTitle: true,
      ),
      builder: (context, viewmodel, child) => Scaffold(
        appBar: child,
        body: viewmodel.busy
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: viewmodel.quizCategories
                    .map(
                      (category) => FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.CategoryQuizListRoute,
                            arguments: category.name,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28.0, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                category.iconData,
                                size: 48,
                              ),
                              Text(
                                category.name,
                                style: TextStyle(fontSize: 16),
                              ),
                              Chip(
                                label: Text('30'),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}

var cats = [
  QuizCategory(
    name: 'Sports',
    iconFamily: 'MaterialIcons',
    iconCodePoint: Icons.adjust.codePoint,
  ),
  QuizCategory(
    name: 'Films',
    iconFamily: 'MaterialIcons',
    iconCodePoint: Icons.movie.codePoint,
  ),
  QuizCategory(
    name: 'Technology',
    iconFamily: 'MaterialIcons',
    iconCodePoint: Icons.ac_unit.codePoint,
  ),
  QuizCategory(
    name: 'Science',
    iconFamily: 'MaterialIcons',
    iconCodePoint: Icons.accessible_forward.codePoint,
  ),
  QuizCategory(
    name: 'History',
    iconFamily: 'MaterialIcons',
    iconCodePoint: Icons.account_balance.codePoint,
  ),
];
