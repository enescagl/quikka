import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizAnswer {
  String id;
  String quizId;
  List<Map<String, String>> questionAnswers;
  QuizAnswer({
    this.id,
    this.quizId,
    this.questionAnswers,
  });

  QuizAnswer copyWith({
    String id,
    String quizId,
    List<Map<String, String>> questionAnswers,
  }) {
    return QuizAnswer(
      id: id ?? this.id,
      quizId: quizId ?? this.quizId,
      questionAnswers: questionAnswers ?? this.questionAnswers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quizId': quizId,
      'questionAnswers': questionAnswers,
    };
  }

  static QuizAnswer fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return QuizAnswer(
      quizId: map['quiz'],
      questionAnswers: List<Map<String, String>>.from(map['questionAnswers']
          ?.map((x) => {
                'questionId': x['questionId'],
                'selectedOption': x['selectedOption']
              })),
    );
  }

  String toJson() => json.encode(toMap());

  static QuizAnswer fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() =>
      'QuizAnswer(id: $id, quizId: $quizId, questionAnswers: $questionAnswers)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizAnswer &&
        o.id == id &&
        o.quizId == quizId &&
        listEquals(o.questionAnswers, questionAnswers);
  }

  @override
  int get hashCode => id.hashCode ^ quizId.hashCode ^ questionAnswers.hashCode;
}
