import 'package:flutter/material.dart';
import 'package:quikka/core/models/quiz_answers.dart';

class ResultView extends StatelessWidget {
  final QuizAnswer quizAnswers;
  ResultView({this.quizAnswers});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text('Results'),
      ),
      body: Column(children: <Widget>[
        Container(),
        Text('Conguratulations'),
        Container(),
        Container(),
      ]),
    );
  }
}
