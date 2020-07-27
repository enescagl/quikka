import 'dart:convert';

import 'package:quikka/core/models/quiz.dart';
import 'package:quikka/core/models/quiz_category.dart';

class QuizPreview {
  String id;
  Quiz quiz;
  // int timesSolved;
  int questionCount;
  QuizCategory quizCategory;
  QuizPreview({
    this.id,
    this.quiz,
    // this.timesSolved,
    this.questionCount,
    this.quizCategory,
  });

  QuizPreview copyWith({
    String id,
    Quiz quiz,
    int timesSolved,
    int questionCount,
    QuizCategory quizCategory,
  }) {
    return QuizPreview(
      id: id ?? this.id,
      quiz: quiz ?? this.quiz,
      // timesSolved: timesSolved ?? this.timesSolved,
      questionCount: questionCount ?? this.questionCount,
      quizCategory: quizCategory ?? this.quizCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz': quiz?.toMap(),
      // 'timesSolved': timesSolved,
      'questionCount': questionCount,
      'quizCategory': quizCategory?.toMap(),
    };
  }

  static QuizPreview fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return QuizPreview(
      id: map['id'],
      quiz: Quiz.fromMap(map['quiz']),
      // timesSolved: map['timesSolved'],
      questionCount: map['questionCount'],
      quizCategory: QuizCategory.fromMap(map['quizCategory']),
    );
  }

  String toJson() => json.encode(toMap());

  static QuizPreview fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() {
    return 'QuizPreview(id: $id, quiz: $quiz, questionCount: $questionCount, quizCategory: $quizCategory)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizPreview &&
        o.id == id &&
        o.quiz == quiz &&
        // o.timesSolved == timesSolved &&
        o.questionCount == questionCount &&
        o.quizCategory == quizCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        quiz.hashCode ^
        // timesSolved.hashCode ^
        questionCount.hashCode ^
        quizCategory.hashCode;
  }
}
