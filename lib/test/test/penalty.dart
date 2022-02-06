class Penalty {
  dynamic home;
  dynamic away;

  Penalty({this.home, this.away});

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        home: json['home'] as dynamic,
        away: json['away'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
