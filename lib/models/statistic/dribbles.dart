import 'dart:convert';

class Dribbles {
  int? attempts;
  int? success;
  dynamic past;

  Dribbles({this.attempts, this.success, this.past});

  factory Dribbles.fromMap(Map<String, dynamic> data) => Dribbles(
        attempts: data['attempts'] as int?,
        success: data['success'] as int?,
        past: data['past'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'attempts': attempts,
        'success': success,
        'past': past,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Dribbles].
  factory Dribbles.fromJson(String data) {
    return Dribbles.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Dribbles] to a JSON string.
  String toJson() => json.encode(toMap());
}
