import 'package:football/models/standing/result_team.dart';

import 'team.dart';

class Teams {
  Team? home;
  Team? away;

  Teams({this.home, this.away});

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: json['home'] == null
            ? null
            : Team.fromJson(json['home'] as Map<String, dynamic>),
        away: json['away'] == null
            ? null
            : Team.fromJson(json['away'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'home': home?.toJson(),
        'away': away?.toJson(),
      };
}
