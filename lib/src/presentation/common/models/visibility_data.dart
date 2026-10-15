import 'package:flutter/material.dart';

import '/src/domain/entity/weather_record.dart';

class VisibilityData {
  const VisibilityData(this.data);

  // default we get value in meter
  final WeatherMeasurement data; // yea can be just extension

  int get _valueInMeter => double.parse(data.value).round();

  /// for homePage card
  String get value {
    final meters = double.parse(data.value);

    return meters >= 1000
        ? (meters / 1000).toStringAsFixed(1)
        : meters.toStringAsFixed(0);
  }

  String get unit {
    return double.parse(data.value) >= 1000 ? "km" : "m";
  }

  /// [maxVisibility] is in meter
  static ({List<Color> colors, List<double> stops}) colors(
    double maxVisibility,
  ) {
    const levels = [
      (10.0, Color(0xFFB71C1C)),
      (100.0, Color(0xFFD32F2F)),
      (1000.0, Color(0xFFE53935)),
      (2000.0, Color(0xFFFB8C00)),
      (5000.0, Color(0xFFFFD54F)),
      (10000.0, Color(0xFF81C784)),
      (double.infinity, Color(0xFF66BB6A)),
    ];

    final colors = <Color>[];
    final stops = <double>[];

    // dart format off
    for (final (threshold, color) in levels) {
      colors.add(color);
      stops.add(threshold.isInfinite ? 1.0 : (threshold / maxVisibility).clamp(0.0, 1.0));

      if (threshold >= maxVisibility) break;
    }

     // dart format on
    return (colors: colors, stops: stops);
  }

  String get label => switch (_valueInMeter) {
    >= 10000 => "excellent",
    >= 5000 => "good",
    >= 2000 => "moderate",
    >= 1000 => "poor",
    _ => "very poor",
  };

  //TODO:  align  with the color after selecting better pallet
  Color get color => switch (_valueInMeter) {
    >= 10000 => Colors.green,
    >= 5000 => Colors.lightGreen,
    >= 2000 => Colors.yellow,
    >= 1000 => Colors.orange,
    _ => Colors.red,
  }.withAlpha(100);
}
