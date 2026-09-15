import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/infrastructure/weather_provider.dart';
import '/src/presentation/widgets/weather_card_view.dart';
import '../../infrastructure/extension/city_weather_ext.dart';
import '../widgets/gradient_background.dart';
import 'widgets/saved_city_appbar.dart';

class SavedCityPage extends StatefulWidget {
  const SavedCityPage._({super.key, required this.view});
  final Widget view;

  factory SavedCityPage({Key? key}) {
    return SavedCityPage._(
      key: key,
      view: Scaffold(
        body: GradientBackground(
          isImage: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const SavedCityAppBar(),
                Expanded(child: SavedCityPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  factory SavedCityPage.view({Key? key}) {
    return SavedCityPage._(key: key, view: SizedBox());
  }

  @override
  State<SavedCityPage> createState() => _SavedCityPageState();
}

class _SavedCityPageState extends State<SavedCityPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherNotifier>(
      builder: (context, data, _) {
        final cities = data.savedCities;
        return cities.isEmpty
            ? const Center(child: Text("You have not saved any city yet"))
            : ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, i) {
                  final weather = cities[i].currenttemp();
                  return WeatherCard(
                    temp: weather.temp,
                    humidity: weather.humadity,
                    rain: weather.rain,
                    location: weather.location,
                    mode: weather.mood,
                  );
                },
              );
      },
    );
  }
}
