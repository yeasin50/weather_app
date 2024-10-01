import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../common/common.dart';
import 'weather_home_bottom_sheet.dart';

class MyCityWeatherView extends StatefulWidget {
  const MyCityWeatherView({
    super.key,
    required this.city,
  });
  final CityInfo city;

  @override
  State<MyCityWeatherView> createState() => _MyCityWeatherViewState();
}

class _MyCityWeatherViewState extends State<MyCityWeatherView> {
  //
  Future<(MetroApiResponse?, String?)> getWeather() async {
    final payload = MetroWeatherPayload(
      latitude: widget.city.latitude,
      longitude: widget.city.longitude,
      hourlyItems: HourlyItem.defaultItems,
    );
    final result = await weatherService.fetchWeather(payload);
    return result;
  }

  late Future<(MetroApiResponse?, String?)> future = getWeather();
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
                  location: widget.city.name,
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
