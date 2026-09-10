import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../common/common.dart';
import '../../common/widgets/glassmorphism.dart';

class MyCityWeatherView extends StatefulWidget {
  const MyCityWeatherView({super.key, required this.city});

  final CityInfo city;

  @override
  State<MyCityWeatherView> createState() => _MyCityWeatherViewState();
}

class _MyCityWeatherViewState extends State<MyCityWeatherView> {
  late final payload = MetroWeatherPayload(
    latitude: widget.city.latitude,
    longitude: widget.city.longitude,
    hourlyItems: HourlyItem.defaultItems,
  );

  late Future<(MetroApiResponse?, String?)> future =
      weatherService.fetchWeather(payload);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<(MetroApiResponse?, String?)>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data?.$2 != null) {
          return Center(
            child:
                Text(snapshot.error?.toString() ?? snapshot.data?.$2 ?? "ugh"),
          );
        }
        final weatherData = snapshot.data!.$1;
        final todaysWeather =
            weatherData!.getCurrentHourWeather(DateTime.now());

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              TodaysWeather(
                temp: todaysWeather?.temperature ?? 0,
                humidity: todaysWeather?.humidity ?? 0,
                rain: todaysWeather?.rain.toInt() ?? 0,
                mood: todaysWeather?.mood.label ?? "",
              ),
              const SizedBox(height: 48),
              Glassmorphism(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text("Hourly Forecast"),
                    ),
                    const SizedBox(height: 16),
                    ForecastHorizontalListview.hourly(
                      padding: const EdgeInsets.only(left: 24),
                      data: weatherData.todaysHourlyForecast,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Glassmorphism(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text("Weekly Forecast"),
                    ),
                    const SizedBox(height: 16),
                    ForecastHorizontalListview.weekly(
                      padding: const EdgeInsets.only(left: 24),
                      data: weatherData.weeklyForecast,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        );
      },
    );
  }
}
