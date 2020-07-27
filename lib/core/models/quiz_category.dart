import 'dart:convert';

import 'package:flutter/material.dart';

class QuizCategory {
  String id;
  String name;
  String iconFamily;
  int iconCodePoint;
  QuizCategory({
    this.id,
    this.name,
    this.iconFamily,
    this.iconCodePoint,
  });

  QuizCategory copyWith({
    String id,
    String name,
    String iconFamily,
    int iconCodePoint,
  }) {
    return QuizCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      iconFamily: iconFamily ?? this.iconFamily,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'iconFamily': iconFamily,
      'iconCodePoint': iconCodePoint,
    };
  }

  static QuizCategory fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return QuizCategory(
      id: map['id'],
      name: map['name'],
      iconFamily: map['iconFamily'],
      iconCodePoint: int.tryParse(map['iconCodePoint']),
    );
  }

  String toJson() => json.encode(toMap());

  static QuizCategory fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  get iconData => IconData(iconCodePoint, fontFamily: "MaterialIcons");

  @override
  String toString() {
    return 'QuizCategory(id: $id, name: $name, iconFamily: $iconFamily, iconCodePoint: $iconCodePoint)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizCategory &&
        o.id == id &&
        o.name == name &&
        o.iconFamily == iconFamily &&
        o.iconCodePoint == iconCodePoint;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        iconFamily.hashCode ^
        iconCodePoint.hashCode;
  }
}
