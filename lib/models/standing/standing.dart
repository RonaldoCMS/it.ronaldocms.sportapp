import 'result.dart';
import 'team.dart';

class Standing {
  int? rank;
  Team? team;
  int? points;
  int? goalsDiff;
  String? group;
  String? form;
  String? status;
  String? description;
  Result? all;
  Result? home;
  Result? away;
  DateTime? update;

  Standing({
    this.rank,
    this.team,
    this.points,
    this.goalsDiff,
    this.group,
    this.form,
    this.status,
    this.description,
    this.all,
    this.home,
    this.away,
    this.update,
  });

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        rank: json['rank'] as int?,
        team: json['team'] == null
            ? null
            : Team.fromJson(json['team'] as Map<String, dynamic>),
        points: json['points'] as int?,
        goalsDiff: json['goalsDiff'] as int?,
        group: json['group'] as String?,
        form: json['form'] as String?,
        status: json['status'] as String?,
        description: json['description'] as String?,
        all: json['all'] == null
            ? null
            : Result.fromJson(json['all'] as Map<String, dynamic>),
        home: json['home'] == null
            ? null
            : Result.fromJson(json['home'] as Map<String, dynamic>),
        away: json['away'] == null
            ? null
            : Result.fromJson(json['away'] as Map<String, dynamic>),
        update: json['update'] == null
            ? null
            : DateTime.parse(json['update'] as String),
      );

  Map<String, dynamic> toJson() => {
        'rank': rank,
        'team': team?.toJson(),
        'points': points,
        'goalsDiff': goalsDiff,
        'group': group,
        'form': form,
        'status': status,
        'description': description,
        'all': all?.toJson(),
        'home': home?.toJson(),
        'away': away?.toJson(),
        'update': update?.toIso8601String(),
      };
}
