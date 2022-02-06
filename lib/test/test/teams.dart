import 'package:football/models/standing/result.dart';

import 'away.dart';
import 'team.dart';

class Teams {
  Result? home;
  Result? away;

  Teams({this.home, this.away});

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: json['home'] == null
            ? null
            : Result.fromJson(json['home'] as Map<String, dynamic>),
        away: json['away'] == null
            ? null
            : Result.fromJson(json['away'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'home': home?.toJson(),
        'away': away?.toJson(),
      };
}
