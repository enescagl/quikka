import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quikka/core/models/quiz.dart';

class QuizAnswers {
  String id;
  Quiz quiz;
  Map<int, int> questionAnswers;
  QuizAnswers({
    this.id,
    this.quiz,
    this.questionAnswers,
  });

  QuizAnswers copyWith({
    String id,
    Quiz quiz,
    Map<int, int> questionAnswers,
  }) {
    return QuizAnswers(
      id: id ?? this.id,
      quiz: quiz ?? this.quiz,
      questionAnswers: questionAnswers ?? this.questionAnswers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz': quiz?.toMap(),
      'questionAnswers': questionAnswers,
    };
  }

  static QuizAnswers fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return QuizAnswers(
      quiz: Quiz.fromMap(map['quiz']),
      questionAnswers: Map<int, int>.from(map['questionAnswers']),
    );
  }

  String toJson() => json.encode(toMap());

  static QuizAnswers fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() =>
      'QuizAnswers(id: $id, quiz: $quiz, questionAnswers: $questionAnswers)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizAnswers &&
        o.id == id &&
        o.quiz == quiz &&
        mapEquals(o.questionAnswers, questionAnswers);
  }

  @override
  int get hashCode => id.hashCode ^ quiz.hashCode ^ questionAnswers.hashCode;
}
