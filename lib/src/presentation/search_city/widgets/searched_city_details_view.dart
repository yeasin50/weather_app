import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

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

    final padding = EdgeInsets.only(left: 16);

    return ListView(
      padding: EdgeInsets.only(top: 36),
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
        Align(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fixedSize: const Size(164, 48),
            ),
            onPressed: () {},
            label: const Text("Save"),
          ),
        )
      ],
    );
  }
}
