import '../models/general/league.dart';

class Result_Stading {
  League? league;

  Result_Stading({this.league});

  factory Result_Stading.fromJson(Map<String, dynamic> json) => Result_Stading(
        league: json['league'] == null
            ? null
            : League.fromJson(json['league'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'league': league?.toJson(),
      };
}
