import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quikka/core/models/question.dart';
import 'package:quikka/core/models/quiz_category.dart';

class Quiz {
  int id;
  String name;
  QuizCategory category;
  List<Question> questions;
  Quiz({
    this.id,
    this.name,
    this.questions,
  });

  Quiz copyWith({
    int id,
    String name,
    List<Question> questions,
  }) {
    return Quiz(
      id: id ?? this.id,
      name: name ?? this.name,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'questions': questions?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Quiz fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Quiz(
      id: map['id'],
      name: map['name'],
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Quiz fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Quiz(id: $id, name: $name, questions: $questions)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Quiz &&
        o.id == id &&
        o.name == name &&
        listEquals(o.questions, questions);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ questions.hashCode;
}
