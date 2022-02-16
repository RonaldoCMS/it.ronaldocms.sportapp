import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:football/models/general/player/player.dart';
import 'package:football/models/statistic/statistic.dart';

class Result_Player {
  Player? player;
  Statistics? statistics;

  Result_Player({this.player, this.statistics});

  factory Result_Player.fromMap(Map<String, dynamic> data) =>
      Result_Player(
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
  /// Parses the string and returns the resulting Json object as [Result_Player].
  factory Result_Player.fromJson(String data) {
    return Result_Player.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result_Player] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result_Player) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => player.hashCode ^ statistics.hashCode;
}
