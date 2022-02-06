import 'dart:convert';

class Games {
  int? appearences;
  int? lineups;
  int? minutes;
  dynamic number;
  String? position;
  String? rating;
  bool? captain;

  Games({
    this.appearences,
    this.lineups,
    this.minutes,
    this.number,
    this.position,
    this.rating,
    this.captain,
  });

  factory Games.fromMap(Map<String, dynamic> data) => Games(
        appearences: data['appearences'] as int?,
        lineups: data['lineups'] as int?,
        minutes: data['minutes'] as int?,
        number: data['number'] as dynamic,
        position: data['position'] as String?,
        rating: data['rating'] as String?,
        captain: data['captain'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'appearences': appearences,
        'lineups': lineups,
        'minutes': minutes,
        'number': number,
        'position': position,
        'rating': rating,
        'captain': captain,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Games].
  factory Games.fromJson(String data) {
    return Games.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Games] to a JSON string.
  String toJson() => json.encode(toMap());
}
