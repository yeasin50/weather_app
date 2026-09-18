import 'package:flutter/material.dart';
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

class _HourlyForecastTile extends StatelessWidget {
  const _HourlyForecastTile({required this.info});
  final HourlyForecast info;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: ShapeDecoration(
        color:
            //used for debug view xd
            info == HourlyForecast.none
            ? Colors.red
            : info.isSelected
            ? const Color(0xFF48319D)
            : const .fromRGBO(72, 49, 157, .2),
        shape: const StadiumBorder(
          side: BorderSide(color: .fromRGBO(255, 255, 255, .2)),
        ),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 6, vertical: 16),
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            Text(info.temp.value, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            //TODO: image path
            Text("${info.weatherCode.value}"),
            const SizedBox(height: 8),
            Text(" ${info.temp.value}\u00B0", style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(AppDateFormatter.hourly(info.time)),
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
        color: info.isSelected
            ? const Color(0xFF48319D)
            : const .fromRGBO(72, 49, 157, .2),
        shape: const StadiumBorder(
          side: BorderSide(color: .fromRGBO(255, 255, 255, .2)),
        ),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 6, vertical: 16),
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            Text("${info.tempMax.value}\u00B0 "),
            Text("${info.tempMin.value}\u00B0 "),
            const SizedBox(height: 8),
            Text("${info.weatherCode.value}"),
            Text("${info.rain.value} %"), // todo:hide 0
            const SizedBox(height: 8),
            Text(AppDateFormatter.daily(info.time)),
          ],
        ),
      ),
    );
  }
}
