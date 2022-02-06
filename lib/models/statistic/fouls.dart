import 'dart:convert';

class Fouls {
  int? drawn;
  int? committed;

  Fouls({this.drawn, this.committed});

  factory Fouls.fromMap(Map<String, dynamic> data) => Fouls(
        drawn: data['drawn'] as int?,
        committed: data['committed'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'drawn': drawn,
        'committed': committed,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Fouls].
  factory Fouls.fromJson(String data) {
    return Fouls.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Fouls] to a JSON string.
  String toJson() => json.encode(toMap());
}
