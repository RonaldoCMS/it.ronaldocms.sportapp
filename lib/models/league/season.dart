import 'dart:convert';

import 'package:collection/collection.dart';

import 'coverage.dart';

class Season {
  int? year;
  String? start;
  String? end;
  bool? current;
  Coverage? coverage;

  Season({this.year, this.start, this.end, this.current, this.coverage});

  factory Season.fromMap(Map<String, dynamic> data) => Season(
        year: data['year'] as int?,
        start: data['start'] as String?,
        end: data['end'] as String?,
        current: data['current'] as bool?,
        coverage: data['coverage'] == null
            ? null
            : Coverage.fromMap(data['coverage'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'year': year,
        'start': start,
        'end': end,
        'current': current,
        'coverage': coverage?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Season].
  factory Season.fromJson(String data) {
    return Season.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Season] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Season) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      year.hashCode ^
      start.hashCode ^
      end.hashCode ^
      current.hashCode ^
      coverage.hashCode;
}
