import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quikka/core/models/question.dart';
import 'package:quikka/core/models/quiz_category.dart';

class Quiz {
  String id;
  String name;
  QuizCategory quizCategory;
  List<Question> questions;
  Quiz({
    this.id,
    this.name,
    this.questions,
    this.quizCategory,
  });

  Quiz copyWith(
      {String id,
      String name,
      List<Question> questions,
      QuizCategory quizCategory}) {
    return Quiz(
      id: id ?? this.id,
      name: name ?? this.name,
      questions: questions ?? this.questions,
      quizCategory: quizCategory ?? this.quizCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'questions': questions?.map((x) => x?.toMap())?.toList(),
      'quizCategory': quizCategory?.toMap(),
    };
  }

  static Quiz fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return Quiz(
        id: map['id'],
        name: map['name'],
        questions: List<Question>.from(
            map['questions']?.map((x) => Question.fromMap(x))),
        quizCategory: QuizCategory.fromMap(map['quizCategory']));
  }

  String toJson() => json.encode(toMap());

  static Quiz fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() =>
      'Quiz(id: $id, name: $name, questions: $questions, quizCategory: $quizCategory)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Quiz &&
        o.id == id &&
        o.name == name &&
        listEquals(o.questions, questions) &&
        o.quizCategory == quizCategory;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ questions.hashCode ^ quizCategory.hashCode;
}
