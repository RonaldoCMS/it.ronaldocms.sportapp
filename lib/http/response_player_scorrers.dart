import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:football/http/paging.dart';
import 'package:football/http/parameters.dart';

import '../models/player/player_statistics.dart';

class Response_Player_TopScorers {
  String? topScorersGet;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Player_Statistics>? response;

  Response_Player_TopScorers({
    this.topScorersGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory Response_Player_TopScorers.fromMap(Map<String, dynamic> data) => Response_Player_TopScorers(
        topScorersGet: data['get'] as String?,
        parameters: data['parameters'] == null
            ? null
            : Parameters.fromMap(data['parameters'] as Map<String, dynamic>),
        errors: data['errors'] as List<dynamic>?,
        results: data['results'] as int?,
        paging: data['paging'] == null
            ? null
            : Paging.fromMap(data['paging'] as Map<String, dynamic>),
        response: (data['response'] as List<dynamic>?)
            ?.map((e) => Player_Statistics.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'get': topScorersGet,
        'parameters': parameters?.toMap(),
        'errors': errors,
        'results': results,
        'paging': paging?.toMap(),
        'response': response?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Response_Player_TopScorers].
  factory Response_Player_TopScorers.fromJson(String data) {
    return Response_Player_TopScorers.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Response_Player_TopScorers] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Response_Player_TopScorers) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      topScorersGet.hashCode ^
      parameters.hashCode ^
      errors.hashCode ^
      results.hashCode ^
      paging.hashCode ^
      response.hashCode;
}
