import 'dart:convert';

class User {
  String id;
  String fullName;
  String appName;
  String imageUrl;
  User({
    this.id,
    this.fullName,
    this.appName,
    this.imageUrl,
  });

  User copyWith({
    String id,
    String fullName,
    String appName,
    String imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      appName: appName ?? this.appName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'appName': appName,
      'imageUrl': imageUrl,
    };
  }

  static User fromMap(Map<String, dynamic> map, {String uid}) {
    if (map == null) return null;
    if (uid != null) map['id'] = uid;

    return User(
      id: map['id'],
      fullName: map['fullName'],
      appName: map['appName'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source, {String uid}) =>
      fromMap(json.decode(source), uid: uid);

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, appName: $appName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.id == id &&
        o.fullName == fullName &&
        o.appName == appName &&
        o.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        appName.hashCode ^
        imageUrl.hashCode;
  }
}
