import 'package:flutter/material.dart';
import '/src/domain/entity/weather_record.dart';

/// to present on UI  layer
/// NOTE: both  fetched 10m above ground
class WindData {
  WindData({
    required this.windSpeed,
    required this.windGusts,
    required this.windDirection,
  });

  final WeatherMeasurement windSpeed;
  final WeatherMeasurement windGusts;
  final WeatherMeasurement windDirection;

  String get value => windSpeed.value;
  String get unit => windSpeed.unit;
  String get description => "Gusts ${windGusts.value}";

  /// this is always in degree
  int get rotation {
    return int.tryParse(windDirection.value) ?? 0;
  }

  /// maxSpeed in kl/h
  static List<Color> colors(double maxSpeed) => [
    const Color(0xFF66BB6A),
    if (maxSpeed > 10) const Color(0xFFFFD54F),
    if (maxSpeed > 20) const Color(0xFFFB8C00),
    if (maxSpeed > 30) const Color(0xFFE53935),
  ];

  //EOF: FIXME: ig I might want a fixed color
  Color get color => switch (double.parse(windSpeed.value).round()) {
    < 5 => Colors.green,
    < 10 => Colors.yellow,
    < 15 => Colors.orange,
    _ => Colors.red,
  }.withAlpha(100);
}
