import 'dart:convert';

import 'package:football/models/fixture/team.dart';
import 'package:football/models/general/league.dart';

import 'cards.dart';
import 'dribbles.dart';
import 'duels.dart';
import 'fouls.dart';
import 'games.dart';
import 'goals.dart';
import 'passes.dart';
import 'penalty.dart';
import 'shots.dart';
import 'substitutes.dart';
import 'tackles.dart';

class Statistics {
  Team? team;
  League? league;
  Games? games;
  Substitutes? substitutes;
  Shots? shots;
  Goals? goals;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;

  Statistics({
    this.team,
    this.league,
    this.games,
    this.substitutes,
    this.shots,
    this.goals,
    this.passes,
    this.tackles,
    this.duels,
    this.dribbles,
    this.fouls,
    this.cards,
    this.penalty,
  });

  factory Statistics.fromMap(Map<String, dynamic> data) => Statistics(
        team: data['team'] == null
            ? null
            : Team.fromMap(data['team'] as Map<String, dynamic>),
        league: data['league'] == null
            ? null
            : League.fromJson(data['league'] as Map<String, dynamic>),
        games: data['games'] == null
            ? null
            : Games.fromMap(data['games'] as Map<String, dynamic>),
        substitutes: data['substitutes'] == null
            ? null
            : Substitutes.fromMap(data['substitutes'] as Map<String, dynamic>),
        shots: data['shots'] == null
            ? null
            : Shots.fromMap(data['shots'] as Map<String, dynamic>),
        goals: data['goals'] == null
            ? null
            : Goals.fromMap(data['goals'] as Map<String, dynamic>),
        passes: data['passes'] == null
            ? null
            : Passes.fromMap(data['passes'] as Map<String, dynamic>),
        tackles: data['tackles'] == null
            ? null
            : Tackles.fromMap(data['tackles'] as Map<String, dynamic>),
        duels: data['duels'] == null
            ? null
            : Duels.fromMap(data['duels'] as Map<String, dynamic>),
        dribbles: data['dribbles'] == null
            ? null
            : Dribbles.fromMap(data['dribbles'] as Map<String, dynamic>),
        fouls: data['fouls'] == null
            ? null
            : Fouls.fromMap(data['fouls'] as Map<String, dynamic>),
        cards: data['cards'] == null
            ? null
            : Cards.fromMap(data['cards'] as Map<String, dynamic>),
        penalty: data['penalty'] == null
            ? null
            : Penalty.fromMap(data['penalty'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'team': team?.toMap(),
        'league': league?.toJson(),
        'games': games?.toMap(),
        'substitutes': substitutes?.toMap(),
        'shots': shots?.toMap(),
        'goals': goals?.toMap(),
        'passes': passes?.toMap(),
        'tackles': tackles?.toMap(),
        'duels': duels?.toMap(),
        'dribbles': dribbles?.toMap(),
        'fouls': fouls?.toMap(),
        'cards': cards?.toMap(),
        'penalty': penalty?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Statistics].
  factory Statistics.fromJson(String data) {
    return Statistics.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Statistics] to a JSON string.
  String toJson() => json.encode(toMap());
}
