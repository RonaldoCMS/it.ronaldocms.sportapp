import 'dart:convert';

class Cards {
  int? yellow;
  int? yellowred;
  int? red;

  Cards({this.yellow, this.yellowred, this.red});

  factory Cards.fromMap(Map<String, dynamic> data) => Cards(
        yellow: data['yellow'] as int?,
        yellowred: data['yellowred'] as int?,
        red: data['red'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'yellow': yellow,
        'yellowred': yellowred,
        'red': red,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cards].
  factory Cards.fromJson(String data) {
    return Cards.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cards] to a JSON string.
  String toJson() => json.encode(toMap());
}
