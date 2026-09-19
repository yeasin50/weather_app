import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infrastructure/infrastructure.dart';
import '../../provider/providers.dart';
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
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<WeatherNotifier>().refreshHomeCity();
        await Future.delayed(Duration(seconds: 2));
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Consumer<CityWeatherNotifier>(
          builder: (context, data, _) {
            final currentHourRecord = data.selectedHourForcast;
            return Column(
              crossAxisAlignment: .stretch,
              children: [
                const SizedBox(height: 48),
                TodaysWeather(data: currentHourRecord),
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
                      ForecastHorizontalListview<HourlyForecast>(
                        padding: const EdgeInsets.only(left: 24),
                        data: data.todaysHourlyForecast,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Glassmorphism(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 16,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: Text("Weekly Forecast"),
                      ),
                      ForecastHorizontalListview<DailyForecast>(
                        padding: const EdgeInsets.only(left: 24),
                        data: data.weeklyForecast,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            );
          },
        ),
      ),
    );
  }
}
