import 'paging.dart';
import 'parameters.dart';
import 'response.dart';

class Response_Fixture {
  String? testGet;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Response>? response;

  Response_Fixture({
    this.testGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory Response_Fixture.fromJson(Map<String, dynamic> json) => Response_Fixture(
        testGet: json['get'] as String?,
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
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
        'get': testGet,
        'parameters': parameters?.toJson(),
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
