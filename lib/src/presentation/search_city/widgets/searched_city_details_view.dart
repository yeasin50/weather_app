import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/app/route_config.dart';
import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../../infrastructure/weather_repo.dart';

import '../../common/widgets/forecast_horizontal_listview.dart';
import '../../common/widgets/todays_weather_card.dart';

class SearchedCityDetailsView extends StatefulWidget {
  const SearchedCityDetailsView({
    super.key,
    required this.data,
    required this.cityInfo,
  });

  final MetroApiResponse data;
  final CityInfo cityInfo;

  @override
  State<SearchedCityDetailsView> createState() => _SearchedCityDetailsViewState();
}

class _SearchedCityDetailsViewState extends State<SearchedCityDetailsView> {
  ///
  ///
  MetroApiResponse get weatherData => widget.data;

  HourlyWeatherInfo get todayWeather => widget.data.getWeather(DateTime.now()) ?? HourlyWeatherInfo.none;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const padding = EdgeInsets.only(left: 16);

    return ListView(
      padding: const EdgeInsets.only(top: 36),
      children: [
        TodaysWeather(
          temp: todayWeather.temperature,
          humidity: todayWeather.humidity,
          rain: todayWeather.rain.toInt(),
          location: widget.cityInfo.name,
          mood: todayWeather.mood.label,
        ),
        const SizedBox(height: 32),
        Padding(
          padding: padding,
          child: Text(
            "Today's Weather ",
            style: textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 12),
        ForecastHorizontalListview.hourly(
          padding: padding,
          data: weatherData.todaysHourlyForecast,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: padding,
          child: Text(
            "This week weather",
            style: textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 12),
        ForecastHorizontalListview.weekly(
          padding: padding,
          data: weatherData.weeklyForecast,
        ),
        const SizedBox(height: 24),
        _ActionButton(city: widget.cityInfo),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.city});
  final CityInfo city;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fixedSize: const Size(164, 48),
          ),
          onPressed: () async {
            await context.localDB.saveCity(city);
             if (context.mounted) context.pop(false);
          },
          child: const Text("Save"),
        ),
        const SizedBox(width: 24),
        ElevatedButton.icon(
          icon: const Icon(Icons.home),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fixedSize: const Size(164, 48),
          ),
          onPressed: () async {
            await context.localDB.saveCity(city.copyWith(isPrimaryCity: true));
            if (context.mounted) context.pop(true);
          },
          label: const Text(
            "My Place",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
