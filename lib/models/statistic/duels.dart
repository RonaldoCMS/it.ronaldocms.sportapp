import 'dart:convert';

class Duels {
  int? total;
  int? won;

  Duels({this.total, this.won});

  factory Duels.fromMap(Map<String, dynamic> data) => Duels(
        total: data['total'] as int?,
        won: data['won'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'won': won,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Duels].
  factory Duels.fromJson(String data) {
    return Duels.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Duels] to a JSON string.
  String toJson() => json.encode(toMap());
}
