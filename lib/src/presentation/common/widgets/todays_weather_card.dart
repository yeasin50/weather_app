import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infrastructure/model/metro_api_weather_code.dart';
import '../../provider/providers.dart';
import '../common.dart';
import '../weather_value_formatter.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.copyWith();
    final schema = Theme.of(context).colorScheme;

    return Consumer<CityWeatherNotifier>(
      builder: (context, weather, _) {
        final data = weather.selectedHourForcast;
        final mood = data.forecast.weatherCode.formatValue;
        final minTemp = data.dayForecast.tempMin.formatValue;
        final maxtemp = data.dayForecast.tempMax.formatValue;
        final feelsLike =
            data.dayForecast.tempMax.formatValue; //TODO: update it
        final moodIcon = WeatherType.fromCode(
          data.forecast.weatherCode.value,
        ).icon;
        return Material(
          color: schema.surfaceContainerLow,
          shape: RoundedRectangleBorder(borderRadius: .circular(9)),
          child: Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              spacing: 24,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 4,
                    mainAxisAlignment: .start,
                    children: [
                      Text(weather.selectedHour.formatDetailed),
                      Text(mood, style: textTheme.titleMedium),
                      Text("Feels like $feelsLike"),
                      SizedBox(height: 16),
                      Text(
                        data.forecast.temp.formatValue +
                            "c", //richText with user preference
                        textAlign: TextAlign.center,
                        style: textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${maxtemp} ${minTemp}",
                        textAlign: .center,
                        style: textTheme.bodyLarge?.copyWith(fontWeight: .w300),
                      ),
                    ],
                  ),
                ),
                Icon(moodIcon, size: 120),
              ],
            ),
          ),
        );
      },
    );
  }
}

//old
class TodaysWeatherV2 extends StatelessWidget {
  const TodaysWeatherV2({super.key});

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
