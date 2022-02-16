import 'dart:convert';

import 'package:collection/collection.dart';

class Fixtures {
  bool? events;
  bool? lineups;
  bool? statisticsFixtures;
  bool? statisticsPlayers;

  Fixtures({
    this.events,
    this.lineups,
    this.statisticsFixtures,
    this.statisticsPlayers,
  });

  factory Fixtures.fromMap(Map<String, dynamic> data) => Fixtures(
        events: data['events'] as bool?,
        lineups: data['lineups'] as bool?,
        statisticsFixtures: data['statistics_fixtures'] as bool?,
        statisticsPlayers: data['statistics_players'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'events': events,
        'lineups': lineups,
        'statistics_fixtures': statisticsFixtures,
        'statistics_players': statisticsPlayers,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Fixtures].
  factory Fixtures.fromJson(String data) {
    return Fixtures.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Fixtures] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Fixtures) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      events.hashCode ^
      lineups.hashCode ^
      statisticsFixtures.hashCode ^
      statisticsPlayers.hashCode;
}
