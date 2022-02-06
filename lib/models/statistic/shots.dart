import 'dart:convert';

class Shots {
  int? total;
  int? on;

  Shots({this.total, this.on});

  factory Shots.fromMap(Map<String, dynamic> data) => Shots(
        total: data['total'] as int?,
        on: data['on'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'on': on,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Shots].
  factory Shots.fromJson(String data) {
    return Shots.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Shots] to a JSON string.
  String toJson() => json.encode(toMap());
}
