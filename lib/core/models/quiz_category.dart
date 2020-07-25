import 'dart:convert';

import 'package:flutter/material.dart';

class QuizCategory {
  String name;
  String iconFamily;
  int iconCodePoint;
  QuizCategory({
    this.name,
    this.iconFamily,
    this.iconCodePoint,
  });

  QuizCategory copyWith({
    String name,
    String iconFamily,
    int iconCodePoint,
  }) {
    return QuizCategory(
      name: name ?? this.name,
      iconFamily: iconFamily ?? this.iconFamily,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'iconFamily': iconFamily,
      'iconCodePoint': iconCodePoint,
    };
  }

  static QuizCategory fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuizCategory(
      name: map['name'],
      iconFamily: map['iconFamily'],
      iconCodePoint: map['iconCodePoint'],
    );
  }

  String toJson() => json.encode(toMap());

  static QuizCategory fromJson(String source) => fromMap(json.decode(source));

  get iconData => IconData(iconCodePoint, fontFamily: "MaterialIcons");

  @override
  String toString() =>
      'QuizCategory(name: $name, iconFamily: $iconFamily, iconCodePoint: $iconCodePoint)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizCategory &&
        o.name == name &&
        o.iconFamily == iconFamily &&
        o.iconCodePoint == iconCodePoint;
  }

  @override
  int get hashCode =>
      name.hashCode ^ iconFamily.hashCode ^ iconCodePoint.hashCode;
}
