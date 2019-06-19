class Result {
  final String text;
  final Location location;

  Result({this.text, this.location});

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(
        text: parsedJson['text'],
        location: Location.fromJson(parsedJson['location']));
  }
}

class Location {
  final int x;
  final int y;
  final int w;
  final int h;

  Location({this.x, this.y, this.w, this.h});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      x: json['x'] as int,
      y: json['y'] as int,
      w: json['w'] as int,
      h: json['h'] as int,
    );
  }
}
