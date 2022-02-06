import 'dart:convert';

import 'package:football/http/parameters.dart';
import 'package:football/models/standing/paging.dart';

import '../models/standing/response.dart';

class Response_Standing {
  String? test1Get;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Response>? response;

  Response_Standing({
    this.test1Get,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory Response_Standing.fromJson(Map<String, dynamic> json) =>
      Response_Standing(
        test1Get: json['get'] as String?,
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(jsonEncode(json['parameters'])),
        errors: json['errors'] as List<dynamic>?,
        results: json['results'] as int?,
        paging: json['paging'] == null
            ? null
            : Paging.fromJson(json['paging'] as Map<String, dynamic>),
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'get': test1Get,
        'parameters': parameters?.toJson(),
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
