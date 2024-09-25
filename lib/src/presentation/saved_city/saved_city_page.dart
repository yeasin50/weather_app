import 'package:flutter/material.dart';
import 'widgets/saved_city_appbar.dart';
import '../widgets/gradient_background.dart';
import '../widgets/weather_card_view.dart';

class SavedCityPage extends StatelessWidget {
  const SavedCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SavedCityAppBar(),
              const SizedBox(height: 8),
              for (final m in WeatherMood.values)
                WeatherCard(
                  temp: 33,
                  humidity: 32,
                  rain: 32,
                  location: "location",
                  mode: m,
                )
            ],
          ),
        ),
      ),
    );
  }
}
