import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

import '../../common/widgets/forecast_horizontal_listview.dart';
import '../../common/widgets/todays_weather_card.dart';

class SearchedCityDetailsView extends StatefulWidget {
  const SearchedCityDetailsView({
    super.key,
    required this.data,
    required this.cityInfo,
    required this.showDeleteButton,
  });

  final MetroApiResponse data;
  final CityInfo cityInfo;
  final bool showDeleteButton;

  @override
  State<SearchedCityDetailsView> createState() => _SearchedCityDetailsViewState();
}

class _SearchedCityDetailsViewState extends State<SearchedCityDetailsView> {
  ///
  ///
  MetroApiResponse get weatherData => widget.data;

  HourlyWeatherInfo get todayWeather => widget.data.getCurrentHourWeather(DateTime.now()) ?? HourlyWeatherInfo.none;

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
    bool showDeleteButton = context.findAncestorWidgetOfExactType<SearchedCityDetailsView>()!.showDeleteButton;

    final bool isMyCity = context.localDB.myHomeCity?.id == city.id;
    final myCityButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.cyanAccent,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fixedSize: const Size(164, 48),
    );

    final saveOrDeleteCityButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: showDeleteButton ? Colors.red.shade300 : Colors.blueGrey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fixedSize: const Size(164, 48),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: saveOrDeleteCityButtonStyle,
          onPressed: () async {
            if (showDeleteButton) {
              await context.localDB.deleteCity(city);
              if (context.mounted) context.pop(showDeleteButton);
            } else {
              await context.localDB.saveCity(city);
              if (context.mounted) context.pop();
            }
          },
          child: Text(showDeleteButton ? "Delete" : "Save"),
        ),
        const SizedBox(width: 24),
        if (!isMyCity)
          ElevatedButton.icon(
            icon: const Icon(Icons.home),
            style: myCityButtonStyle,
            onPressed: () async {
              await context.localDB.saveCity(city.copyWith(isPrimaryCity: true));
              if (context.mounted) context.pop();
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
