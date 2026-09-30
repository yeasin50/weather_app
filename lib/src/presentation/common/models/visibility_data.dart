import 'package:flutter/material.dart';

import '/src/domain/entity/weather_record.dart';

class VisibilityData {
  const VisibilityData(this.data);

  // default we get value in meter
  // in future might have user preference
  final WeatherMeasurement data; // yea can be just extension

  int get _valueInMeter => double.parse(data.value).round();

  String get value {
    final meters = double.parse(data.value);

    return meters >= 1000
        ? (meters / 1000).toStringAsFixed(1)
        : meters.toStringAsFixed(0);
  }

  String get unit {
    return double.parse(data.value) >= 1000 ? "km" : "m";
  }

  String get label => switch (_valueInMeter) {
    >= 10000 => "excellent",
    >= 5000 => "good",
    >= 2000 => "moderate",
    >= 1000 => "poor",
    _ => "very poor",
  };

  Color get color => switch (_valueInMeter) {
    >= 10000 => Colors.green,
    >= 5000 => Colors.lightGreen,
    >= 2000 => Colors.yellow,
    >= 1000 => Colors.orange,
    _ => Colors.red,
  }.withAlpha(100);
}
