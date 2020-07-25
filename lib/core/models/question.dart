import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  String text;
  List<Map<int, String>> options;
  Question({
    this.text,
    this.options,
  });

  Question copyWith({
    String text,
    List<Map<int, String>> options,
  }) {
    return Question(
      text: text ?? this.text,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'options': options,
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Question(
      text: map['text'],
      options: List<Map<int, String>>.from(map['options']?.map((x) => x)),
    );
  }

  String toJson() => json.encode(toMap());

  static Question fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Question(text: $text, options: $options)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Question && o.text == text && listEquals(o.options, options);
  }

  @override
  int get hashCode => text.hashCode ^ options.hashCode;
}
