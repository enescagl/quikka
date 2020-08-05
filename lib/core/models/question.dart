import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  String id;
  String text;
  List<Map<String, dynamic>> options;
  Question({
    this.id,
    this.text,
    this.options,
  });

  Question copyWith({
    String id,
    String text,
    List<Map<String, dynamic>> options,
  }) {
    return Question(
      id: id ?? this.id,
      text: text ?? this.text,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'options': options,
    };
  }

  static Question fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return Question(
      id: map['id'],
      text: map['text'],
      options: List<Map<String, dynamic>>.from(
          map['options']?.map((x) => {'id': x['id'], 'option': x['option']})),
    );
  }

  String toJson() => json.encode(toMap());

  static Question fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() => 'Question(id: $id, text: $text, options: $options)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Question &&
        o.id == id &&
        o.text == text &&
        listEquals(o.options, options);
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ options.hashCode;
}
