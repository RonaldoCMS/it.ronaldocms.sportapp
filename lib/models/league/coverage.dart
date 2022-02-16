import 'dart:convert';

import 'package:collection/collection.dart';

import 'fixtures.dart';

class Coverage {
  Fixtures? fixtures;
  bool? standings;
  bool? players;
  bool? topScorers;
  bool? topAssists;
  bool? topCards;
  bool? injuries;
  bool? predictions;
  bool? odds;

  Coverage({
    this.fixtures,
    this.standings,
    this.players,
    this.topScorers,
    this.topAssists,
    this.topCards,
    this.injuries,
    this.predictions,
    this.odds,
  });

  factory Coverage.fromMap(Map<String, dynamic> data) => Coverage(
        fixtures: data['fixtures'] == null
            ? null
            : Fixtures.fromMap(data['fixtures'] as Map<String, dynamic>),
        standings: data['standings'] as bool?,
        players: data['players'] as bool?,
        topScorers: data['top_scorers'] as bool?,
        topAssists: data['top_assists'] as bool?,
        topCards: data['top_cards'] as bool?,
        injuries: data['injuries'] as bool?,
        predictions: data['predictions'] as bool?,
        odds: data['odds'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'fixtures': fixtures?.toMap(),
        'standings': standings,
        'players': players,
        'top_scorers': topScorers,
        'top_assists': topAssists,
        'top_cards': topCards,
        'injuries': injuries,
        'predictions': predictions,
        'odds': odds,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Coverage].
  factory Coverage.fromJson(String data) {
    return Coverage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Coverage] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Coverage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      fixtures.hashCode ^
      standings.hashCode ^
      players.hashCode ^
      topScorers.hashCode ^
      topAssists.hashCode ^
      topCards.hashCode ^
      injuries.hashCode ^
      predictions.hashCode ^
      odds.hashCode;
}
