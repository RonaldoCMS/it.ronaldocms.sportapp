import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:football/http/paging.dart';

import '../repositories/response_leagues.dart';

class Response_Leagues {
  String? apiLeanguesGet;
  List<dynamic>? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Result_Leagues>? response;

  Response_Leagues({
    this.apiLeanguesGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory Response_Leagues.fromMap(Map<String, dynamic> data) => Response_Leagues(
        apiLeanguesGet: data['get'] as String?,
        parameters: data['parameters'] as List<dynamic>?,
        errors: data['errors'] as List<dynamic>?,
        results: data['results'] as int?,
        paging: data['paging'] == null
            ? null
            : Paging.fromMap(data['paging'] as Map<String, dynamic>),
        response: (data['response'] as List<dynamic>?)
            ?.map((e) => Result_Leagues.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'get': apiLeanguesGet,
        'parameters': parameters,
        'errors': errors,
        'results': results,
        'paging': paging?.toMap(),
        'response': response?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Response_Leagues].
  factory Response_Leagues.fromJson(String data) {
    return Response_Leagues.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Response_Leagues] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Response_Leagues) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      apiLeanguesGet.hashCode ^
      parameters.hashCode ^
      errors.hashCode ^
      results.hashCode ^
      paging.hashCode ^
      response.hashCode;
}
