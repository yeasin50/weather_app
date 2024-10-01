import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import '../widgets/gradient_background.dart';
import 'widgets/saved_city_appbar.dart';
import 'widgets/saved_city_list_view.dart';

class SavedCityPage extends StatefulWidget {
  const SavedCityPage({super.key});

  @override
  State<SavedCityPage> createState() => _SavedCityPageState();
}

class _SavedCityPageState extends State<SavedCityPage> {
  late Future<List<CityInfo>> getSavedCity = localDB.fetch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              const SavedCityAppBar(),
              Expanded(
                child: FutureBuilder<List<CityInfo>>(
                    future: getSavedCity,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final loadedCityData = snapshot.data ?? [];
                      final payload = loadedCityData
                          .map((e) => MetroWeatherPayload(
                                latitude: e.latitude,
                                longitude: e.longitude,
                                hourlyItems: HourlyItem.defaultItems,
                              ))
                          .toList();
                      return loadedCityData.isEmpty
                          ? const Center(
                              child: Text("You have not saved any city yet"),
                            )
                          : FutureBuilder(
                              future: weatherService.fetchCitiesWeather(payload),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState != ConnectionState.done) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                final data = snapshot.data?.map((e) => e.$1).toList();

                                return LoadCityWeatherListView(cities: loadedCityData, data: data);
                              },
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
