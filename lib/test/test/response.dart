import 'package:football/models/standing/league.dart';

import 'fixture.dart';
import 'goals.dart';
import 'score.dart';
import 'teams.dart';

class Response {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  Response({this.fixture, this.league, this.teams, this.goals, this.score});

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        fixture: json['fixture'] == null
            ? null
            : Fixture.fromJson(json['fixture'] as Map<String, dynamic>),
        league: json['league'] == null
            ? null
            : League.fromJson(json['league'] as Map<String, dynamic>),
        teams: json['teams'] == null
            ? null
            : Teams.fromJson(json['teams'] as Map<String, dynamic>),
        goals: json['goals'] == null
            ? null
            : Goals.fromJson(json['goals'] as Map<String, dynamic>),
        score: json['score'] == null
            ? null
            : Score.fromJson(json['score'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'fixture': fixture?.toJson(),
        'league': league?.toJson(),
        'teams': teams?.toJson(),
        'goals': goals?.toJson(),
        'score': score?.toJson(),
      };
}
