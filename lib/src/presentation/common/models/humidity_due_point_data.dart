import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';

class HumidityDuePointData {
  const HumidityDuePointData(this._humadity, this._duePoint);
  final WeatherMeasurement _humadity;
  final WeatherMeasurement _duePoint;

  int get humidity => double.parse("${_humadity.value.toString()}").toInt();
  int get dewPoint => double.parse("${_duePoint.value.toString()}").toInt();

  static List<Color> humidityColors = [
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
  ];

  static List<Color> dewPointColors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
  ];

  Color get humidityColor => switch (humidity) {
    < 30 => Colors.orange,
    < 50 => Colors.green,
    < 70 => Colors.yellow,
    < 85 => Colors.orange,
    _ => Colors.red,
  }.withAlpha(100);

  String get humidityLevel => switch (humidity) {
    < 30 => "dry",
    < 50 => "comfortable",
    < 70 => "moderate",
    < 85 => "humid",
    _ => "very_humid",
  };

  Color get dewPointColor => switch (dewPoint) {
    < 10 => Colors.blue,
    < 16 => Colors.green,
    < 19 => Colors.yellow,
    < 22 => Colors.orange,
    < 25 => Colors.red,
    _ => Colors.purple,
  }.withAlpha(100);

  String get dewPointLevel => switch (dewPoint) {
    < 10 => "very_dry",
    < 16 => "comfortable",
    < 19 => "slightly_humid",
    < 22 => "humid",
    < 25 => "very_humid",
    _ => "oppressive",
  };
}
