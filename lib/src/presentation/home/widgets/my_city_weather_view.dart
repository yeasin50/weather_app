import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../../infrastructure/weather_provider.dart';
import '../../common/common.dart';
import '../../common/widgets/glassmorphism.dart';

class MyCityWeatherView extends StatefulWidget {
  const MyCityWeatherView({super.key});

  @override
  State<MyCityWeatherView> createState() => _MyCityWeatherViewState();
}

class _MyCityWeatherViewState extends State<MyCityWeatherView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<WeatherNotifier>(
        builder: (context, data, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              // TodaysWeather(
              //   temp: todaysWeather?.temperature ?? 0,
              //   humidity: todaysWeather?.humidity ?? 0,
              //   rain: todaysWeather?.rain.toInt() ?? 0,
              //   mood: todaysWeather?.mood.label ?? "",
              // ),
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
                    // ForecastHorizontalListview.hourly(
                    //   padding: const EdgeInsets.only(left: 24),
                    //   data: weatherData.todaysHourlyForecast,
                    // ),
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
                    // ForecastHorizontalListview.weekly(
                    //   padding: const EdgeInsets.only(left: 24),
                    //   data: weatherData.weeklyForecast,
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          );
        },
      ),
    );
  }
}
