class Periods {
  int? first;
  int? second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json['first'] as int?,
        second: json['second'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'second': second,
      };
}
