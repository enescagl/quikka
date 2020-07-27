import 'package:flutter/material.dart';
import 'package:quikka/core/models/quiz.dart';

class QuizView extends StatelessWidget {
  final Quiz quiz;
  QuizView({this.quiz});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text(quiz.quizCategory.name),
      ),
      body: Column(children: <Widget>[
        Text(quiz.name),
        Stack(
          children: quiz.questions
              .map(
                (question) => Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(question.text),
                        ...question.options.entries
                            .map((option) => OutlineButton(
                                  onPressed: null,
                                  child: Text(option.value),
                                ))
                            .toList()
                      ],
                    ),
                    Column(children: <Widget>[
                      RaisedButton(
                        child: Text('Send'),
                        onPressed: () {},
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
    );
  }
}
