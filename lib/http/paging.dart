import 'dart:convert';

import 'package:collection/collection.dart';

class Paging {
  int? current;
  int? total;

  Paging({this.current, this.total});

  factory Paging.fromMap(Map<String, dynamic> data) => Paging(
        current: data['current'] as int?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'current': current,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Paging].
  factory Paging.fromJson(String data) {
    return Paging.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Paging] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Paging) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => current.hashCode ^ total.hashCode;
}
