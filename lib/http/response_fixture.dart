import 'package:football/http/paging.dart';
import 'package:football/http/parameters.dart';

import '../repositories/result_fixture.dart';

class Response_Fixture {
  String? testGet;
  DefaultParameter? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Result_Fixture>? response;

  Response_Fixture({
    this.testGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory Response_Fixture.fromJson(Map<String, dynamic> json) =>
      Response_Fixture(
        testGet: json['get'] as String?,
        parameters: json['parameters'] == null
            ? null
            : DefaultParameter.fromMap(json['parameters'] as Map<String, dynamic>),
        errors: json['errors'] as List<dynamic>?,
        results: json['results'] as int?,
        paging: json['paging'] == null
            ? null
            : Paging.fromMap(json['paging'] as Map<String, dynamic>),
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => Result_Fixture.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'get': testGet,
        'parameters': parameters?.toJson(),
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
