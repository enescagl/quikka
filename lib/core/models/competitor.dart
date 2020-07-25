import 'dart:convert';

class Competitor {
  int id;
  String fullName;
  String appName;
  String imageUrl;
  String rank;
  String point;
  String solvedQuizCount;
  Competitor({
    this.id,
    this.fullName,
    this.appName,
    this.imageUrl,
    this.rank,
    this.point,
    this.solvedQuizCount,
  });

  Competitor copyWith({
    int id,
    String fullName,
    String appName,
    String imageUrl,
    String rank,
    String point,
    String solvedQuizCount,
  }) {
    return Competitor(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      appName: appName ?? this.appName,
      imageUrl: imageUrl ?? this.imageUrl,
      rank: rank ?? this.rank,
      point: point ?? this.point,
      solvedQuizCount: solvedQuizCount ?? this.solvedQuizCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'appName': appName,
      'imageUrl': imageUrl,
      'rank': rank,
      'point': point,
      'solvedQuizCount': solvedQuizCount,
    };
  }

  static Competitor fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Competitor(
      id: map['id'],
      fullName: map['fullName'],
      appName: map['appName'],
      imageUrl: map['imageUrl'],
      rank: map['rank'],
      point: map['point'],
      solvedQuizCount: map['solvedQuizCount'],
    );
  }

  String toJson() => json.encode(toMap());

  static Competitor fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Competitor(id: $id, fullName: $fullName, appName: $appName, imageUrl: $imageUrl, rank: $rank, point: $point, solvedQuizCount: $solvedQuizCount)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Competitor &&
        o.id == id &&
        o.fullName == fullName &&
        o.appName == appName &&
        o.imageUrl == imageUrl &&
        o.rank == rank &&
        o.point == point &&
        o.solvedQuizCount == solvedQuizCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        appName.hashCode ^
        imageUrl.hashCode ^
        rank.hashCode ^
        point.hashCode ^
        solvedQuizCount.hashCode;
  }
}
