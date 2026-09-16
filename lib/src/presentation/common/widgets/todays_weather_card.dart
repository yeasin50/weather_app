import 'package:flutter/material.dart';

import '../../../domain/entity/weather_record.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({
    super.key,
    required this.temp,
    required this.humidity,
    required this.rain,
    required this.mood,
  });

  final WeatherMeasurement temp;
  final WeatherMeasurement humidity;
  final WeatherMeasurement rain;

  final String mood;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.copyWith();

    final tempValue = int.tryParse(temp.value) ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${tempValue.toStringAsFixed(0)}\u00B0",
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.copyWith(color: Colors.white),
        ),
        Text(mood, textAlign: TextAlign.center, style: textTheme.bodyLarge),
        const SizedBox(height: 8),
        Text(
          "H:${humidity.value}\u00B0 L:${rain.value}\u00B0",
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(),
        ),
      ],
    );
  }
}
