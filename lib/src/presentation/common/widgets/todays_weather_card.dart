import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

        final formatter = context.read<UserFormatter>();

        final tempUnit = formatter.tempUnit;
        final currentTemp = formatter.temp(data.forecast.temp);

        final minTemp = formatter.temp(data.dayForecast.tempMin);
        final maxtemp = formatter.temp(data.dayForecast.tempMax);

        final feelsLike = formatter.temp(data.forecast.tempFeelLike);

        final moodIcon = formatter.moodIcon(data.forecast.weatherCode, 120);

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
                      Text.rich(
                        TextSpan(
                          text: currentTemp,
                          style: textTheme.displayLarge?.copyWith(),
                          children: [
                            TextSpan(
                              text: tempUnit,
                              style: textTheme.displayMedium?.copyWith(
                                color: textTheme.displayMedium?.color
                                    ?.withValues(alpha: .7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '↑ $maxtemp ↓ $minTemp',
                        style: textTheme.bodyLarge?.copyWith(fontWeight: .w300),
                      ),
                    ],
                  ),
                ),
                moodIcon,
              ],
            ),
          ),
        );
      },
    );
  }
}

@Deprecated("See top huhaha")
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
