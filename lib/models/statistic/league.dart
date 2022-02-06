import 'dart:convert';

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;

  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
  });

  factory League.fromMap(Map<String, dynamic> data) => League(
        id: data['id'] as int?,
        name: data['name'] as String?,
        country: data['country'] as String?,
        logo: data['logo'] as String?,
        flag: data['flag'] as String?,
        season: data['season'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'country': country,
        'logo': logo,
        'flag': flag,
        'season': season,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [League].
  factory League.fromJson(String data) {
    return League.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [League] to a JSON string.
  String toJson() => json.encode(toMap());
}
