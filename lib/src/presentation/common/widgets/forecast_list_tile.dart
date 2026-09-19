import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import '../../../infrastructure/model/metro_api_weather_code.dart';
import '/src/presentation/common/common.dart';
import '../../provider/providers.dart';

class ForecastListTile<T extends ForecastData> extends StatelessWidget {
  const ForecastListTile({
    super.key,
    required this.label,
    required this.info,
    this.isActive = false,
  });

  /// dayName / hour/ now
  final String label;
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

String _valueFormatter(WeatherMeasurement data) {
  return switch (data.measurementType) {
    .temperature || .temperatureMax || .temperatureMin => "${data.value}\u00B0",
    .rain || .precipitationProbability => () {
      final value = double.tryParse(data.value)?.toInt();
      assert(
        value != null,
        "invaid parse ${data.measurementType} value ${data.value}",
      );
      return value == 0 ? "" : "${value ?? "NA"}%";
    }(),
    _ => () {
      assert(false, " missing type ${data.measurementType}");
      return "NA";
    }(),
  };
}

class _HourlyForecastTile extends StatelessWidget {
  const _HourlyForecastTile({required this.info});
  final HourlyForecast info;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const .symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          Text(_valueFormatter(info.temp), style: textTheme.bodyLarge),
          const SizedBox(height: 8),
          Text(_valueFormatter(info.rain)),
          const SizedBox(height: 8),
          Icon(WeatherType.fromCode(info.weatherCode.value).icon),
          const SizedBox(height: 8),
          Text(
            AppDateFormatter.hourly(info.time),
            style: textTheme.bodyLarge?.copyWith(fontWeight: .w500),
          ),
          Text(
            AppDateFormatter.hourly(info.time, true),
            style: textTheme.bodySmall,
          ),
        ],
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
        color: info.isSelected
            ? const Color(0xFF48319D)
            : const .fromRGBO(72, 49, 157, .2),
        shape: const StadiumBorder(
          side: BorderSide(color: .fromRGBO(255, 255, 255, .2)),
        ),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 8, vertical: 16),
        child: Column(
          mainAxisAlignment: .spaceAround,
          spacing: 6,
          children: [
            Text(
              _valueFormatter(info.tempMax),
              style: textTheme.bodyMedium?.copyWith(fontWeight: .w500),
            ),
            Text(_valueFormatter(info.tempMin), style: textTheme.bodyMedium),
            const SizedBox(),
            Icon(WeatherType.fromCode(info.weatherCode.value).icon),
            Text(_valueFormatter(info.rain)),
            Text(AppDateFormatter.daily(info.time)),
          ],
        ),
      ),
    );
  }
}
