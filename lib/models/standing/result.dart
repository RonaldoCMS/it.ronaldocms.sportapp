import 'goals.dart';

class Result {
  /*id: 500
name: "Bologna"
logo: "https://media.api-sports.io/football/teams/500.png"
winner: true*/

  int? played;
  int? win;
  int? draw;
  int? lose;
  Goals? goals;

  Result({this.played, this.win, this.draw, this.lose, this.goals});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        played: json['played'] as int?,
        win: json['win'] as int?,
        draw: json['draw'] as int?,
        lose: json['lose'] as int?,
        goals: json['goals'] == null
            ? null
            : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'played': played,
        'win': win,
        'draw': draw,
        'lose': lose,
        'goals': goals?.toJson(),
      };
}
