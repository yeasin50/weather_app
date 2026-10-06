import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/presentation/common/common.dart';
import '../../provider/providers.dart';

class ForecastListTile<T extends ForecastData> extends StatelessWidget {
  const ForecastListTile({super.key, required this.info});

  final T info;

  @override
  Widget build(BuildContext context) {
    assert(
      info is HourlyForecast || info is DailyForecast || info is StarForecast,
      'Expected HourlyForecast or DailyForecast',
    );

    return info is HourlyForecast || info is StarForecast
        ? _HourlyForecastTile(info: info)
        : _DailyForecastTile(info: info as DailyForecast);
  }
}

class _HourlyForecastTile extends StatelessWidget {
  const _HourlyForecastTile({required this.info});
  final ForecastData info;

  @override
  Widget build(BuildContext context) {
    assert(info is HourlyForecast || info is StarForecast);

    final textTheme = Theme.of(context).textTheme;

    final formmater = context.read<UserFormatter>();

    return Padding(
      padding: const .symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onTap: () {
          ///todo: nav to day view
          print(info.toString());
        },
        child: Column(
          mainAxisAlignment: .spaceBetween,
          spacing: 6,
          children: info is HourlyForecast
              ? [
                  Text(AppDateFormatter.hourly(info.time)),
                  formmater.moodIcon(info.weatherCode),
                  Text(
                    formmater.temp((info as HourlyForecast).temp),
                    style: textTheme.bodyLarge,
                  ),
                ]
              : () {
                  final bool isSunrise =
                      info.weatherCode.measurementType == .sunrise;
                  return [
                    Text(info.time.formatHMa),
                    Icon(isSunrise ? Icons.wb_sunny : Icons.nightlight_round),
                    Text(
                      isSunrise ? "sunrise" : "sunset",
                      style: textTheme.bodyLarge,
                    ),
                  ];
                }(),
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
    final formatter = context.read<UserFormatter>();

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
                  formatter.moodIcon(info.weatherCode),
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
                    formatter.temp(info.tempMax),
                    style: textTheme.bodyMedium?.copyWith(fontWeight: .w500),
                  ),
                  Text(
                    "/",
                    style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  Text(
                    formatter.temp(info.tempMin),
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
