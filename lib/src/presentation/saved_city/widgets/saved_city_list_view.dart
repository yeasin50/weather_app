import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/route_config.dart';
import '../../../infrastructure/infrastructure.dart';
import 'my_city_card_view.dart';

import '../../../domain/domain.dart';
import '../../widgets/weather_card_view.dart';

@Deprecated("Will be removed")
class LoadCityWeatherListView extends StatefulWidget {
  const LoadCityWeatherListView({super.key});

  @override
  State<LoadCityWeatherListView> createState() =>
      _LoadCityWeatherListViewState();
}

class _LoadCityWeatherListViewState extends State<LoadCityWeatherListView> {
  // List<(CityInfo, MetroApiResponse)> data = [];
  // List<(CityInfo, MetroApiResponse)> filterData = [];
  //
  // (CityInfo, MetroApiResponse)? myCity;

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() {
    // for (int i = 0; i < widget.cities.length; i++) {
    //   final city = widget.cities[i];
    //
    //   if (city.isPrimaryCity) {
    //     myCity = (city, widget.data![i]!);
    //   } else {
    //     data.add((city, widget.data![i]!));
    //   }
    // }
    // filterData = [...data];
  }

  void onSearchChanged(String? str) {
    // if (str == null || str.isEmpty) {
    //   filterData = [...data];
    //   setState(() {});
    //   return;
    // }
    // filterData = data
    //     .where((e) => e.$1.name.toLowerCase().contains(str.toLowerCase()))
    //     .toList();
    //
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        CupertinoSearchTextField(
          onChanged: onSearchChanged,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        // MyCityCardView(
        //   myCity: myCity,
        //   onRemove: () {
        //     myCity = null;
        //     setState(() {});
        //   },
        // ),
        const SizedBox(height: 24),
        Text("Saved city", style: textTheme.titleLarge),
        const SizedBox(height: 8),
        // Expanded(
        //   child: ListView.separated(
        //     itemCount: filterData.length,
        //     separatorBuilder: (context, index) => const SizedBox(height: 8),
        //     itemBuilder: (context, index) {
        //       final currentHourData = filterData[index].$2
        //           .getCurrentHourWeather(DateTime.now());
        //       return WeatherCard(
        //         temp: currentHourData!.temperature,
        //         humidity: currentHourData.humidity,
        //         rain: currentHourData.rain.toInt(),
        //         location: filterData[index].$1.name,
        //         mode: currentHourData.mood,
        //         onTap: () async {
        //           final bool hasRemoved =
        //               await context.push(
        //                 AppRoute.cityWeatherDetails,
        //                 extra: {
        //                   "city": filterData[index].$1,
        //                   "isFromSaved": true,
        //                 },
        //               ) ??
        //               false;
        //           if (hasRemoved) {
        //             data.removeAt(index);
        //             filterData = [...data];
        //             setState(() {});
        //           }
        //         },
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
