import 'package:flutter/material.dart';

import '../../provider/providers.dart';
import '../weather_value_formatter.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({super.key, required this.data});

  final HourlyForecast data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.copyWith();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data.weatherCode.formatValue,
          textAlign: .center,
          style: textTheme.bodyLarge,
        ),
        Text(
          data.temp.formatValue,
          textAlign: TextAlign.center,
          style: textTheme.displayLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 8), //TODO:  new properties
        Text("Feels like xxx", textAlign: .center),
        Text(
          "Max:${data.temp.formatValue}  Min:${data.temp.formatValue}",
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(),
        ),
      ],
    );
  }
}
