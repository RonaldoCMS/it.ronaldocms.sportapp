import 'dart:convert';

import 'package:collection/collection.dart';

class Birth {
  String? date;
  String? place;
  String? country;

  Birth({this.date, this.place, this.country});

  factory Birth.fromMap(Map<String, dynamic> data) => Birth(
        date: data['date'] as String?,
        place: data['place'] as String?,
        country: data['country'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'date': date,
        'place': place,
        'country': country,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Birth].
  factory Birth.fromJson(String data) {
    return Birth.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Birth] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Birth) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => date.hashCode ^ place.hashCode ^ country.hashCode;
}
