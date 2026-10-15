import 'package:flutter/material.dart';

import '../../../domain/entity/weather_record.dart';

class UVIndexParser {
  const UVIndexParser(this.data);
  final WeatherMeasurement data;

  static List<Color> colors = [
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
  ];

  double get value => double.parse(data.value.toString());

  int get colorIndex => getColorIndex(value);

  static int getColorIndex(double value) {
    return switch (value) {
      < 3 => 0,
      < 6 => 1,
      < 8 => 2,
      _ => 3,
    };
  }

  String get level => getlevel(value.toDouble());

  static String getlevel(double value) {
    return switch (value) {
      < 0 => "dead",
      < 3 => "low",
      < 6 => "moderate",
      < 8 => "high",
      < 11 => "very_high",
      _ => "extreme",
    };
  }

  String get guide {
    return switch (value) {
      < 0 => "dead",
      < 3 => "You can safely enjoy being outside!",
      < 8 =>
        "Seek shade during midday hours! Slip on a shirt, slop on sunscreen and slap on hat! ",
      _ =>
        "Avoid being outside during midday hours! Make sure you seek shade! Shirt, sunscreen and hat are a must!",
    };
  }
}
