class Halftime {
  int? home;
  int? away;

  Halftime({this.home, this.away});

  factory Halftime.fromJson(Map<String, dynamic> json) => Halftime(
        home: json['home'] as int?,
        away: json['away'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
