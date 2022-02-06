import 'dart:convert';

class Passes {
  int? total;
  int? key;
  int? accuracy;

  Passes({this.total, this.key, this.accuracy});

  factory Passes.fromMap(Map<String, dynamic> data) => Passes(
        total: data['total'] as int?,
        key: data['key'] as int?,
        accuracy: data['accuracy'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'key': key,
        'accuracy': accuracy,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Passes].
  factory Passes.fromJson(String data) {
    return Passes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Passes] to a JSON string.
  String toJson() => json.encode(toMap());
}
