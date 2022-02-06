import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:football/models/statistic/statistic.dart';

import 'player.dart';

class Player_Statistics {
  Player? player;
  Statistics? statistics;

  Player_Statistics({this.player, this.statistics});

  factory Player_Statistics.fromMap(Map<String, dynamic> data) =>
      Player_Statistics(
        player: data['player'] == null
            ? null
            : Player.fromMap(data['player'] as Map<String, dynamic>),
        statistics: Statistics.fromMap(data['statistics'].first),
      );

  Map<String, dynamic> toMap() => {
        'player': player?.toMap(),
        'statistics': statistics!.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Player_Statistics].
  factory Player_Statistics.fromJson(String data) {
    return Player_Statistics.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Player_Statistics] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Player_Statistics) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => player.hashCode ^ statistics.hashCode;
}
