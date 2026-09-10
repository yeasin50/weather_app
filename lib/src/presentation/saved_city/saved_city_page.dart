import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../widgets/gradient_background.dart';
import 'widgets/saved_city_appbar.dart';
import 'widgets/saved_city_list_view.dart';

class SavedCityPage extends StatefulWidget {
  const SavedCityPage._({super.key, required this.view});
  final Widget view;

  factory SavedCityPage({Key? key}) {
    return SavedCityPage._(
      key: key,
      view: Scaffold(
        body: GradientBackground(
          isImage: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const SavedCityAppBar(),
                Expanded(child: SavedCityPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  factory SavedCityPage.view({Key? key}) {
    return SavedCityPage._(key: key, view: SizedBox());
  }

  @override
  State<SavedCityPage> createState() => _SavedCityPageState();
}

//TODO: gonna migrate view into  just list; onTap gonna close drawer and show on homePage
class _SavedCityPageState extends State<SavedCityPage> {
  late Future<List<CityInfo>> getSavedCity = localDB
      .fetch(); //gonna fetch  after init and cache

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityInfo>>(
      future: getSavedCity,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        final loadedCityData = snapshot.data ?? [];
        final payload = loadedCityData
            .map(
              (e) => MetroWeatherPayload(
                latitude: e.latitude,
                longitude: e.longitude,
                hourlyItems: HourlyItem.defaultItems,
              ),
            )
            .toList();
        return loadedCityData.isEmpty
            ? const Center(child: Text("You have not saved any city yet"))
            : FutureBuilder(
                future: weatherService.fetchCitiesWeather(
                  payload,
                ), // FIXME: don't wanna fetch  weather, cache it and show last update on ui +  refresh  button
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.data?.map((e) => e.$1).toList();

                  return LoadCityWeatherListView(
                    cities: loadedCityData,
                    data: data,
                  );
                },
              );
      },
    );
  }
}
