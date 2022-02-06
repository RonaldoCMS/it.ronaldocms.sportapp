import 'dart:convert';

class Tackles {
  int? total;
  dynamic blocks;
  int? interceptions;

  Tackles({this.total, this.blocks, this.interceptions});

  factory Tackles.fromMap(Map<String, dynamic> data) => Tackles(
        total: data['total'] as int?,
        blocks: data['blocks'] as dynamic,
        interceptions: data['interceptions'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'blocks': blocks,
        'interceptions': interceptions,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tackles].
  factory Tackles.fromJson(String data) {
    return Tackles.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tackles] to a JSON string.
  String toJson() => json.encode(toMap());
}
