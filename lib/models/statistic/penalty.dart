import 'dart:convert';

class Penalty {
  dynamic won;
  dynamic commited;
  int? scored;
  int? missed;
  dynamic saved;

  Penalty({this.won, this.commited, this.scored, this.missed, this.saved});

  factory Penalty.fromMap(Map<String, dynamic> data) => Penalty(
        won: data['won'] as dynamic,
        commited: data['commited'] as dynamic,
        scored: data['scored'] as int?,
        missed: data['missed'] as int?,
        saved: data['saved'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'won': won,
        'commited': commited,
        'scored': scored,
        'missed': missed,
        'saved': saved,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Penalty].
  factory Penalty.fromJson(String data) {
    return Penalty.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Penalty] to a JSON string.
  String toJson() => json.encode(toMap());
}
