import 'dart:convert';

import 'package:collection/collection.dart';

class DefaultParameter {
  String? league;
  String? season;

  DefaultParameter({this.league, this.season});

  factory DefaultParameter.fromMap(Map<String, dynamic> data) => DefaultParameter(
        league: data['league'] as String?,
        season: data['season'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'league': league,
        'season': season,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DefaultParameter].
  factory DefaultParameter.fromJson(String data) {
    return DefaultParameter.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DefaultParameter] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DefaultParameter) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => league.hashCode ^ season.hashCode;
}
