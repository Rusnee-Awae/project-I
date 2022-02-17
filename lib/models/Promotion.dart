import 'dart:convert';

class Promotion {
  final String name;
  final String cover;
  Promotion({
    this.name,
    this.cover,
  });

  Promotion copyWith({
    String name,
    String cover,
  }) {
    return Promotion(
      name: name ?? this.name,
      cover: cover ?? this.cover,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cover': cover,
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      name: map['name'],
      cover: map['cover'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Promotion.fromJson(String source) =>
      Promotion.fromMap(json.decode(source));

  @override
  String toString() => 'Promotion(name: $name, cover: $cover)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Promotion && other.name == name && other.cover == cover;
  }

  @override
  int get hashCode => name.hashCode ^ cover.hashCode;
}
