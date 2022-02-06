import 'dart:convert';

class Team {
  int? id;
  String? name;
  String? logo;

  Team({this.id, this.name, this.logo});

  factory Team.fromMap(Map<String, dynamic> data) => Team(
        id: data['id'] as int?,
        name: data['name'] as String?,
        logo: data['logo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Team].
  factory Team.fromJson(String data) {
    return Team.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Team] to a JSON string.
  String toJson() => json.encode(toMap());
}
