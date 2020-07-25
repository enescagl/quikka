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
        title: Text(quiz.category.name),
      ),
      body: Column(children: <Widget>[
        Text(quiz.name),
        Container(),
      ]),
    );
  }
}
