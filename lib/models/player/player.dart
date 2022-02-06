import 'dart:convert';

import 'package:collection/collection.dart';

import 'birth.dart';

class Player {
  int? id;
  String? name;
  String? firstname;
  String? lastname;
  int? age;
  Birth? birth;
  String? nationality;
  String? height;
  String? weight;
  bool? injured;
  String? photo;

  Player({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.age,
    this.birth,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.photo,
  });

  factory Player.fromMap(Map<String, dynamic> data) => Player(
        id: data['id'] as int?,
        name: data['name'] as String?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        age: data['age'] as int?,
        birth: data['birth'] == null
            ? null
            : Birth.fromMap(data['birth'] as Map<String, dynamic>),
        nationality: data['nationality'] as String?,
        height: data['height'] as String?,
        weight: data['weight'] as String?,
        injured: data['injured'] as bool?,
        photo: data['photo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'birth': birth?.toMap(),
        'nationality': nationality,
        'height': height,
        'weight': weight,
        'injured': injured,
        'photo': photo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Player].
  factory Player.fromJson(String data) {
    return Player.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Player] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Player) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      age.hashCode ^
      birth.hashCode ^
      nationality.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      injured.hashCode ^
      photo.hashCode;
}
