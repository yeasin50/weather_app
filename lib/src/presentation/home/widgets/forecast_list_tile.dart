import 'package:flutter/material.dart';
import '../../../infrastructure/infrastructure.dart';

class ForecastListTile extends StatelessWidget {
  const ForecastListTile({
    super.key,
    required this.label,
    required this.info,
    this.isActive = false,
  });

  /// dayName / hour/ now
  final String label;
  final HourlyWeatherInfo info;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: isActive ? const Color(0xFF48319D) : const Color.fromRGBO(72, 49, 157, .2),
          shape: const StadiumBorder(
            side: BorderSide(
              color: Color.fromRGBO(255, 255, 255, .2),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                label,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Image.asset(info.mood.imagePath, width: 48),
              const SizedBox(height: 8),
              Text(
                " ${info.temperature.toStringAsFixed(0)}\u00B0",
                style: textTheme.titleLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
