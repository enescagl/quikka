import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/viewmodels/quiz_view_model.dart';
import 'package:quikka/ui/shared/base_widget.dart';

class QuizView extends StatefulWidget {
  final Quiz quiz;
  QuizView({this.quiz});

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<Map<String, String>> questionSelections;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<QuizViewModel>(
      viewmodel: QuizViewModel(dataService: Provider.of(context)),
      onViewModelReady: (viewmodel) {
        viewmodel.getQuestions(widget.quiz);
        viewmodel.getCategory(widget.quiz.quizCategoryId);
      },
      builder: (context, viewmodel, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey[900],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: viewmodel.busy
              ? CircularProgressIndicator()
              : Text(
                  viewmodel.quizCategory.name,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        body: widget.quiz == null
            ? Center(
                child: Text('Please wait while questions loading...'),
              )
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 3) / 5,
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Center(
                            child: Text(
                              widget.quiz.name,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12.0 * 7.0),
                    child: buildQuestionBox(viewmodel, widget.quiz),
                  )
                ],
              ),
      ),
    );
  }

  Container buildQuestionBox(QuizViewModel viewmodel, Quiz quiz) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[400],
      ),
      child: Column(
        children: <Widget>[
          ...viewmodel.questions
              .map(
                (question) => Center(
                  child: Column(
                    children: <Widget>[
                      Text(question.text),
                      ...question.options.map(
                        (option) => OutlineButton(
                          onPressed: () {
                            questionSelections.add({
                              'questionId': question.id,
                              'selectedOption': option['id']
                            });
                          },
                          child: Text(
                            option['option'],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
          RaisedButton(
            onPressed: () {
              viewmodel.sendAnswerSelection(quiz, questionSelections);
            },
            child: Text('Send'),
          ),
          RaisedButton(
            onPressed: null,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
