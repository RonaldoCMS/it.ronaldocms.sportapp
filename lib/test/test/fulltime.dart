class Fulltime {
  int? home;
  int? away;

  Fulltime({this.home, this.away});

  factory Fulltime.fromJson(Map<String, dynamic> json) => Fulltime(
        home: json['home'] as int?,
        away: json['away'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
