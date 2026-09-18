import 'package:flutter/material.dart';
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
        : Text("TODO");
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
            : const Color.fromRGBO(72, 49, 157, .2),
        shape: const StadiumBorder(
          side: BorderSide(color: Color.fromRGBO(255, 255, 255, .2)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(info.temp.value, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            // Image.asset(info.mood.imagePath, width: 48), //TODO: image path
            const SizedBox(height: 8),
            Text(" ${info.temp.value}\u00B0", style: textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
