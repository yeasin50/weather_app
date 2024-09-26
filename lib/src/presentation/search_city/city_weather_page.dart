import 'package:flutter/material.dart';
import 'package:weather_app/src/infrastructure/repository/metro_weather_repo.dart';
import '../../domain/domain.dart';
import '../widgets/gradient_background.dart';

import '../home/widgets/todays_weather_card.dart';

class CityWeatherPage extends StatefulWidget {
  const CityWeatherPage({
    super.key,
    required this.city,
  });
  final CityInfo city;

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  final weatherRepo = MetroWeatherRepo();

  late (MetroApiResponse?, String?)? result = null;

  @override
  void initState() {
    super.initState();
    final payload = MetroWeatherPayload(
      latitude: widget.city.latitude,
      longitude: widget.city.longitude,
    );
    weatherRepo.fetchWeather(payload).then(
          (value) => setState(
            () {
              result = value;
            },
          ),
        );
  }

  String get location => widget.city.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: ListView(
          children: [
            if (result == null)
              const CircularProgressIndicator() //
            else if (result!.$2 != null)
              Text("${result!.$2}")
            else
              Column(
                children: [
                  TodaysWeather(
                    temp: 33,
                    humidity: 23,
                    rain: 12,
                    location: location,
                    mood: "mode",
                  ),
                  Text("${result!.$1!.timeZone}")
                ],
              ),
          ],
        ),
      ),
    );
  }
}
