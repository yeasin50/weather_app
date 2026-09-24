import 'package:flutter/material.dart';

import '/src/presentation/common/common.dart';
import '../../../infrastructure/model/metro_api_weather_code.dart';
import '../../provider/providers.dart';
import '../weather_value_formatter.dart';

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
      padding: const .symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onTap: () {
          ///todo: nav to day view
        },
        child: Column(
          mainAxisAlignment: .spaceBetween,
          spacing: 6,
          children: [
            Text(AppDateFormatter.hourly(info.time)),
            Icon(WeatherType.fromCode(info.weatherCode.value).icon),

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

    return InkWell(
      onTap: () {
        /// ...
      },
      child: Padding(
        padding: const .symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          spacing: 8,
          children: [
            SizedBox(width: 80, child: Text(AppDateFormatter.daily(info.time))),
            Expanded(
              child: Row(
                spacing: 4,
                mainAxisAlignment: .start,
                children: [
                  Icon(WeatherType.fromCode(info.weatherCode.value).icon),
                  Flexible(child: Text(info.weatherCode.formatValue)),
                ],
              ),
            ),
            // Text(info.rain.formatValue, style: textTheme.bodySmall),
            SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    info.tempMax.formatValue,
                    style: textTheme.bodyMedium?.copyWith(fontWeight: .w500),
                  ),
                  Text("/"),
                  Text(info.tempMin.formatValue, style: textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
