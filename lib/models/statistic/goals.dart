import 'dart:convert';

class Goals {
  int? total;
  int? conceded;
  int? assists;
  dynamic saves;

  Goals({this.total, this.conceded, this.assists, this.saves});

  factory Goals.fromMap(Map<String, dynamic> data) => Goals(
        total: data['total'] as int?,
        conceded: data['conceded'] as int?,
        assists: data['assists'] as int?,
        saves: data['saves'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'conceded': conceded,
        'assists': assists,
        'saves': saves,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Goals].
  factory Goals.fromJson(String data) {
    return Goals.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Goals] to a JSON string.
  String toJson() => json.encode(toMap());
}
