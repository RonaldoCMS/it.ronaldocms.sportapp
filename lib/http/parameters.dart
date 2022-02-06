import 'dart:convert';

import 'package:collection/collection.dart';

class Parameters {
  String? league;
  String? season;

  Parameters({this.league, this.season});

  factory Parameters.fromMap(Map<String, dynamic> data) => Parameters(
        league: data['league'] as String?,
        season: data['season'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'league': league,
        'season': season,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Parameters].
  factory Parameters.fromJson(String data) {
    return Parameters.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Parameters] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Parameters) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => league.hashCode ^ season.hashCode;
}
