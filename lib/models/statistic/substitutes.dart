import 'dart:convert';

class Substitutes {
  int? substitutesIn;
  int? out;
  int? bench;

  Substitutes({this.substitutesIn, this.out, this.bench});

  factory Substitutes.fromMap(Map<String, dynamic> data) => Substitutes(
        substitutesIn: data['in'] as int?,
        out: data['out'] as int?,
        bench: data['bench'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'in': substitutesIn,
        'out': out,
        'bench': bench,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Substitutes].
  factory Substitutes.fromJson(String data) {
    return Substitutes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Substitutes] to a JSON string.
  String toJson() => json.encode(toMap());
}
