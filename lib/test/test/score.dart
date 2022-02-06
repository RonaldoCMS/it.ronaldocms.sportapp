import 'extratime.dart';
import 'fulltime.dart';
import 'halftime.dart';
import 'penalty.dart';

class Score {
  Halftime? halftime;
  Fulltime? fulltime;
  Extratime? extratime;
  Penalty? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: json['halftime'] == null
            ? null
            : Halftime.fromJson(json['halftime'] as Map<String, dynamic>),
        fulltime: json['fulltime'] == null
            ? null
            : Fulltime.fromJson(json['fulltime'] as Map<String, dynamic>),
        extratime: json['extratime'] == null
            ? null
            : Extratime.fromJson(json['extratime'] as Map<String, dynamic>),
        penalty: json['penalty'] == null
            ? null
            : Penalty.fromJson(json['penalty'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'halftime': halftime?.toJson(),
        'fulltime': fulltime?.toJson(),
        'extratime': extratime?.toJson(),
        'penalty': penalty?.toJson(),
      };
}
