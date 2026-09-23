import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../weather_value_formatter.dart';
import '/src/presentation/common/common.dart';
import '../../provider/providers.dart';
import '../../../infrastructure/model/metro_api_weather_code.dart';

class ForecastListTile<T extends ForecastData> extends StatelessWidget {
  const ForecastListTile({
    super.key,
    required this.info,
    this.isActive = false,
  });

  final T info;

  @Deprecated("use T")
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    assert(
      info is HourlyForecast || info is DailyForecast,
      'Expected HourlyForecast or DailyForecast',
    );

    return info is HourlyForecast
        ? _HourlyForecastTile(info: info as HourlyForecast)
        : _DailyForecastTile(info: info as DailyForecast);
  }
}

class _HourlyForecastTile extends StatelessWidget {
  const _HourlyForecastTile({required this.info});
  final HourlyForecast info;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const .symmetric(horizontal: 8, vertical: 16),
      child: InkWell(
        onTap: () {
          //shows bottom-sheet
        },
        child: Column(
          mainAxisAlignment: .spaceBetween,
          spacing: 4,
          children: [
            Text(AppDateFormatter.hourly(info.time)),
            Icon(WeatherType.fromCode(info.weatherCode.value).icon),

            Text(info.rain.formatValue),
            Text(info.temp.formatValue, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}

class _DailyForecastTile extends StatelessWidget {
  const _DailyForecastTile({required this.info});
  final DailyForecast info;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: .spaceAround,
          spacing: 8,
          children: [
            Text(AppDateFormatter.daily(info.time)),

            SizedBox(height: 2),
            Icon(WeatherType.fromCode(info.weatherCode.value).icon),
            Text(info.rain.formatValue, style: textTheme.bodySmall),
            SizedBox(height: 2),
            Text(
              info.tempMax.formatValue,
              style: textTheme.bodyMedium?.copyWith(fontWeight: .w500),
            ),
            Text(info.tempMin.formatValue, style: textTheme.bodyMedium),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
