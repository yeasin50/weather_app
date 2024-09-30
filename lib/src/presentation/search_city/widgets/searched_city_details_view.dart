import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/extension/metro_api_response_ext.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

import '../../common/widgets/forecast_horizontal_listview.dart';
import '../../common/widgets/hourly_weekly_forecast_view.dart';
import '../../common/widgets/todays_weather_card.dart';
import '../../home/widgets/weather_home_bottom_sheet.dart';

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
        Text(
          "Today's Weather ",
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        ForecastHorizontalListview.hourly(
          data: weatherData.todaysHourlyForecast,
        ),
        const SizedBox(height: 24),
        Text(
          "This week weather",
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        ForecastHorizontalListview.weekly(
          data: weatherData.weeklyForecast,
        ),
        const SizedBox(height: 24),
        Align(
          child: ElevatedButton.icon(
            icon: Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fixedSize: Size(164, 48),
            ),
            onPressed: () {},
            label: Text("Save"),
          ),
        )
      ],
    );
  }
}
