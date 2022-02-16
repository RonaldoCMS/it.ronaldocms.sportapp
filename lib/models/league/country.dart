import 'dart:convert';

import 'package:collection/collection.dart';

class Country {
  String? name;
  dynamic code;
  dynamic flag;

  Country({this.name, this.code, this.flag});

  factory Country.fromMap(Map<String, dynamic> data) => Country(
        name: data['name'] as String?,
        code: data['code'] as dynamic,
        flag: data['flag'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'code': code,
        'flag': flag,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Country].
  factory Country.fromJson(String data) {
    return Country.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Country) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => name.hashCode ^ code.hashCode ^ flag.hashCode;
}
