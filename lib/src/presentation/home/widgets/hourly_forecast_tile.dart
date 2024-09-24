import 'package:flutter/material.dart';
import '../../widgets/weather_card_view.dart';

class ForecastRowTile extends StatelessWidget {
  const ForecastRowTile({
    super.key,
    required this.label,
    required this.mood,
    required this.temp,
    this.isActive = false,
  });

  /// dayName / hour/ now
  final String label;
  final WeatherMood mood;
  final int temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // final bool isNow = time.hour == DateTime.now().hour;
    // String hour = isNow ? "Now" : time.hour.toString();

    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                label,
                style: textTheme.titleLarge,
              ),
              Image.asset(
                mood.imagePath,
                width: 48,
              ),
              Text(
                "$temp\u00B0",
                style: textTheme.titleLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
