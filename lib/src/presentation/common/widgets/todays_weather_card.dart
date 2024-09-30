import 'package:flutter/material.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({
    super.key,
    required this.temp,
    required this.humidity,
    required this.rain,
    required this.location,
    required this.mood,
  });

  final double temp;
  final int humidity;
  final int rain;
  final String location;

  final String mood;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.copyWith();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          location,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium?.copyWith(),
        ),
        Text(
          "${temp.toStringAsFixed(0)}\u00B0",
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          mood,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        Text(
          "H:$humidity\u00B0 L:$rain\u00B0",
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(),
        ),
      ],
    );
  }
}
