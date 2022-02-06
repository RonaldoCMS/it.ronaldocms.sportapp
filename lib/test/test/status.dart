class Status {
  String? long;
  String? short;
  int? elapsed;

  Status({this.long, this.short, this.elapsed});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json['long'] as String?,
        short: json['short'] as String?,
        elapsed: json['elapsed'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'long': long,
        'short': short,
        'elapsed': elapsed,
      };
}
