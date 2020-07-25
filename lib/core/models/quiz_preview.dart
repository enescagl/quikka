import 'dart:convert';

import 'package:quikka/core/models/quiz.dart';

class QuizPreview {
  int id;
  Quiz quiz;
  int timesSolved;
  int questionCount;
  QuizPreview({
    this.id,
    this.quiz,
    this.timesSolved,
    this.questionCount,
  });

  QuizPreview copyWith({
    int id,
    Quiz quiz,
    int timesSolved,
    int questionCount,
  }) {
    return QuizPreview(
      id: id ?? this.id,
      quiz: quiz ?? this.quiz,
      timesSolved: timesSolved ?? this.timesSolved,
      questionCount: questionCount ?? this.questionCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz': quiz?.toMap(),
      'timesSolved': timesSolved,
      'questionCount': questionCount,
    };
  }

  static QuizPreview fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuizPreview(
      id: map['id'],
      quiz: Quiz.fromMap(map['quiz']),
      timesSolved: map['timesSolved'],
      questionCount: map['questionCount'],
    );
  }

  String toJson() => json.encode(toMap());

  static QuizPreview fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizPreview(id: $id, quiz: $quiz, timesSolved: $timesSolved, questionCount: $questionCount)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizPreview &&
        o.id == id &&
        o.quiz == quiz &&
        o.timesSolved == timesSolved &&
        o.questionCount == questionCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        quiz.hashCode ^
        timesSolved.hashCode ^
        questionCount.hashCode;
  }
}
