import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../common/common.dart';
import 'weather_home_bottom_sheet.dart';

class MyCityWeatherView extends StatelessWidget {
  const MyCityWeatherView({
    super.key,
    required this.city,
  });
  final CityInfo city;

  @override
  Widget build(BuildContext context) {
    final payload = MetroWeatherPayload(
      latitude: city.latitude,
      longitude: city.longitude,
      hourlyItems: HourlyItem.defaultItems,
    );
    return FutureBuilder<(MetroApiResponse?, String?)>(
        future: context.weatherService.fetchWeather(payload),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.$2 != null) {
            return Center(
              child: Text(snapshot.error?.toString() ?? snapshot.data?.$2 ?? "ugh"),
            );
          }
          final weatherData = snapshot.data!.$1;
          final todaysWeather = weatherData!.getCurrentHourWeather(DateTime.now());

          return Stack(
            children: [
              Align(
                alignment: const Alignment(0, -.75),
                child: TodaysWeather(
                  temp: todaysWeather?.temperature ?? 0,
                  humidity: todaysWeather?.humidity ?? 0,
                  rain: todaysWeather?.rain.toInt() ?? 0,
                  location: city.name,
                  mood: todaysWeather?.mood.label ?? "",
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: HomeWeatherBottomSheet(
                  key: ValueKey(weatherData.hourlyData?.time.first),
                  hourlyForecast: weatherData.todaysHourlyForecast,
                  weeklyForecast: weatherData.weeklyForecast,
                ),
              )
            ],
          );
        });
  }
}
