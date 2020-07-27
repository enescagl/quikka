import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikka/core/constants/route_paths.dart';
import 'package:quikka/core/viewmodels/category_quiz_list_view_model.dart';
import 'package:quikka/ui/shared/base_widget.dart';

class CategoryQuizListView extends StatelessWidget {
  final String categoryUid;
  CategoryQuizListView({this.categoryUid});
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CategoryQuizListViewModel>(
      onViewModelReady: (viewmodel) {
        viewmodel.getQuizPreviews(categoryUid);
        viewmodel.getCategory(categoryUid);
      },
      viewmodel:
          CategoryQuizListViewModel(firestoreService: Provider.of(context)),
      builder: (context, viewmodel, child) => Scaffold(
        appBar: AppBar(
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
            '${viewmodel.category.name} Quizes',
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: ExpansionPanelList.radio(
              children: viewmodel.quizPreviews
                  .map(
                    (preview) => ExpansionPanelRadio(
                      value: preview.quiz.id,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => Text(
                        preview.quiz.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      body: Row(
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: preview.quiz.quizCategory.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                children: [
                                  // TextSpan(
                                  //   text: '${preview.timesSolved}',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.bold),
                                  //   children: [
                                  //     TextSpan(text: 'people solved this quiz.')
                                  //   ],
                                  // ),
                                  TextSpan(
                                    text: '${preview.questionCount}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    children: [TextSpan(text: 'questions.')],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutePaths.QuizRoute,
                                  arguments: preview.quiz,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

// var _quizPreviews = [
//   QuizPreview(
//     id: 1,
//     quiz: Quiz(
//       id: 1,
//       name: 'How well do you know Lionel Messi?',
//       questions: [
//         Question(
//           text: 'When did he born?',
//           options: [
//             {
//               1: '1988',
//               2: '1988',
//               3: '1988',
//               4: '1988',
//             },
//           ],
//         ),
//       ],
//     ),
//     questionCount: 1,
//     timesSolved: 1,
//   ),
// ];
