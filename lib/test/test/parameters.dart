class Parameters {
  String? league;
  String? season;

  Parameters({this.league, this.season});

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        league: json['league'] as String?,
        season: json['season'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'league': league,
        'season': season,
      };
}
