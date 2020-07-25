import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quikka/core/models/quiz.dart';

class QuizAnswers {
  Quiz quiz;
  Map<int, int> questionAnswers;
  QuizAnswers({
    this.quiz,
    this.questionAnswers,
  });

  QuizAnswers copyWith({
    Quiz quiz,
    Map<int, int> questionAnswers,
  }) {
    return QuizAnswers(
      quiz: quiz ?? this.quiz,
      questionAnswers: questionAnswers ?? this.questionAnswers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quiz': quiz?.toMap(),
      'questionAnswers': questionAnswers,
    };
  }

  static QuizAnswers fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuizAnswers(
      quiz: Quiz.fromMap(map['quiz']),
      questionAnswers: Map<int, int>.from(map['questionAnswers']),
    );
  }

  String toJson() => json.encode(toMap());

  static QuizAnswers fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'QuizAnswers(quiz: $quiz, questionAnswers: $questionAnswers)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizAnswers &&
        o.quiz == quiz &&
        mapEquals(o.questionAnswers, questionAnswers);
  }

  @override
  int get hashCode => quiz.hashCode ^ questionAnswers.hashCode;
}
