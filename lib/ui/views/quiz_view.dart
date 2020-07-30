import 'package:flutter/material.dart';
import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/models/quiz_answers.dart';
import 'package:quikka/core/viewmodels/quiz_view_model.dart';
import 'package:quikka/ui/shared/base_widget.dart';

class QuizView extends StatefulWidget {
  final Quiz quiz;
  QuizView({this.quiz});

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  Map<String, int> questionSelections;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<QuizViewModel>(
      viewmodel: QuizViewModel(),
      onViewModelReady: (viewmodel) => viewmodel.getQuestions(widget.quiz),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text(widget.quiz.quizCategoryId),
      ),
      builder: (context, viewmodel, child) => Scaffold(
        appBar: child,
        body: Column(children: <Widget>[
          Text(widget.quiz.name),
          Stack(
            children: viewmodel.questions
                .map(
                  (question) => Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(question.text),
                          ...question.options.entries
                              .map((option) => OutlineButton(
                                    onPressed: () {
                                      questionSelections[question.id] =
                                          option.key;
                                    },
                                    child: Text(option.value),
                                  ))
                              .toList()
                        ],
                      ),
                      Column(children: <Widget>[
                        RaisedButton(
                          child: Text('Send'),
                          onPressed: () {
                            var quizAnswer = QuizAnswer(
                                questionAnswers: questionSelections,
                                quizId: widget.quiz.id);

                            viewmodel.saveAnswerSelection(quizAnswer);
                          },
                        ),
                        RaisedButton(
                          child: Text('Next'),
                          onPressed: () {},
                        ),
                      ])
                    ],
                  ),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }
}
