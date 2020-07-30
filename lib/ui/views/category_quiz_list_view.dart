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
      viewmodel:
          CategoryQuizListViewModel(firestoreService: Provider.of(context)),
      onViewModelReady: (viewmodel) {
        viewmodel.getQuizPreviews(categoryUid);
        viewmodel.getCategory(categoryUid);
      },
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
                      value: preview.id,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            preview.quiz.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              preview.questionCount.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ButtonTheme(
                              padding: EdgeInsets.all(0),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              minWidth: 0,
                              height: 0,
                              child: FlatButton(
                                child: Icon(Icons.arrow_forward),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
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
