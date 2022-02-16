class Team {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Team({this.id, this.name, this.logo, this.winner});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'] as int?,
        name: json['name'] as String?,
        logo: json['logo'] as String?,
        winner: json['winner'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
        'winner': winner,
      };

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
}
