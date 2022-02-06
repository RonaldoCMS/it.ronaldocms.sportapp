import 'league.dart';

class Response {
  League? league;

  Response({this.league});

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        league: json['league'] == null
            ? null
            : League.fromJson(json['league'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'league': league?.toJson(),
      };
}
