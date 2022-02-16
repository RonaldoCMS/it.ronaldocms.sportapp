class Extratime {
  dynamic home;
  dynamic away;

  Extratime({this.home, this.away});

  factory Extratime.fromJson(Map<String, dynamic> json) => Extratime(
        home: json['home'] as dynamic,
        away: json['away'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
