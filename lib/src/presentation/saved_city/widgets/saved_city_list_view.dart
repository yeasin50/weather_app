import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

import '../../../domain/domain.dart';
import '../../widgets/weather_card_view.dart';

class LoadCityWeatherListView extends StatefulWidget {
  const LoadCityWeatherListView({
    super.key,
    required this.cities,
    required this.data,
  });
  final List<MetroApiResponse?>? data;
  final List<CityInfo> cities;
  @override
  State<LoadCityWeatherListView> createState() => _LoadCityWeatherListViewState();
}

class _LoadCityWeatherListViewState extends State<LoadCityWeatherListView> {
  List<(CityInfo, MetroApiResponse)> data = [];
  List<(CityInfo, MetroApiResponse)> filterData = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.cities.length; i++) {
      data.add((widget.cities[i], widget.data![i]!));
    }
    filterData = [...data];
  }

  void onSearchChanged(String? str) {
    if (str == null || str.isEmpty) {
      filterData = [...data];
      setState(() {});
      return;
    }
    filterData = data
        .where(
          (e) => e.$1.name.toLowerCase().contains(str.toLowerCase()),
        )
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 16),
        CupertinoSearchTextField(
          onChanged: onSearchChanged,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
            child: ListView.builder(
          itemCount: filterData.length,
          itemBuilder: (context, index) {
            final currentHourData = filterData[index].$2.getCurrentHourWeather(DateTime.now());
            return WeatherCard(
              temp: currentHourData!.temperature,
              humidity: currentHourData.humidity,
              rain: currentHourData.rain.toInt(),
              location: filterData[index].$1.name,
              // location: cities.elementAt(index).name,
              mode: currentHourData.mood,
            );
          },
        )),
      ],
    );
  }
}
