import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:football/models/general/league.dart';

import '../models/league/country.dart';
import '../models/league/season.dart';

class Result_Leagues {
  League? league;
  Country? country;
  List<Season>? seasons;

  Result_Leagues({this.league, this.country, this.seasons});

  factory Result_Leagues.fromMap(Map<String, dynamic> data) => Result_Leagues(
        league: data['league'] == null
            ? null
            : League.fromJson(data['league'] as Map<String, dynamic>),
        country: data['country'] == null
            ? null
            : Country.fromMap(data['country'] as Map<String, dynamic>),
        seasons: (data['seasons'] as List<dynamic>?)
            ?.map((e) => Season.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'league': league?.toJson(),
        'country': country?.toMap(),
        'seasons': seasons?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result_Leagues].
  factory Result_Leagues.fromJson(String data) {
    return Result_Leagues.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result_Leagues] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result_Leagues) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => league.hashCode ^ country.hashCode ^ seasons.hashCode;
}
