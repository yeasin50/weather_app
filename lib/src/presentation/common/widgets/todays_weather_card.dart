import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/providers.dart';
import '../weather_value_formatter.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.copyWith();

    return Consumer<CityWeatherNotifier>(
      builder: (context, weather, _) {
        final data = weather.selectedHourForcast;
        final mood = data.forecast.weatherCode.formatValue;
        final minTemp = data.dayForecast.tempMin.formatValue;
        final maxtemp = data.dayForecast.tempMax.formatValue;
        final feelsLike =
            data.dayForecast.tempMax.formatValue; //TODO: update it

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Text(mood, textAlign: .center, style: textTheme.bodyLarge),
            Text(
              data.forecast.temp.formatValue,
              textAlign: TextAlign.center,
              style: textTheme.displayLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8), //TODO:  new properties
            Text("Feels like $feelsLike", textAlign: .center),
            Text(
              "Max:${maxtemp}  Min:${minTemp}",
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(),
            ),
          ],
        );
      },
    );
  }
}
