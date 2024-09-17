import 'package:flutter/material.dart';

import '../domain/domain.dart';
import 'widgets/weather_card_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MetroApiResponse> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // for (final m in WeatherMood.values)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WeatherCard(
              temp: 12,
              humidity: 4,
              rain: 3,
              location: "location",
              mode: WeatherMood.fastWind,
            ),
          ),
        ],
      ),
    );
  }
}
