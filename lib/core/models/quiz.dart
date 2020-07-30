import 'dart:convert';

import 'package:flutter/foundation.dart';

class Quiz {
  String id;
  String name;
  String quizCategoryId;
  List<String> questionIds;
  Quiz({
    this.id,
    this.name,
    this.questionIds,
    this.quizCategoryId,
  });

  Quiz copyWith(
      {String id, String name, List<String> questionIds, int quizCategoryId}) {
    return Quiz(
      id: id ?? this.id,
      name: name ?? this.name,
      questionIds: questionIds ?? this.questionIds,
      quizCategoryId: quizCategoryId ?? this.quizCategoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'questions': questionIds?.map((x) => x)?.toList(),
      'quizCategory': quizCategoryId,
    };
  }

  static Quiz fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return Quiz(
        id: map['id'],
        name: map['name'],
        questionIds: List<String>.from(map['questions']?.map((x) => x)),
        quizCategoryId: map['quizCategory']);
  }

  String toJson() => json.encode(toMap());

  static Quiz fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() =>
      'Quiz(id: $id, name: $name, questions: $questionIds, quizCategoryId: $quizCategoryId)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Quiz &&
        o.id == id &&
        o.name == name &&
        listEquals(o.questionIds, questionIds) &&
        o.quizCategoryId == quizCategoryId;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      questionIds.hashCode ^
      quizCategoryId.hashCode;
}
