import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/search_city/widgets/searched_city_details_view.dart';

import '../../domain/domain.dart';
import '../../infrastructure/repository/metro_weather_repo.dart';
import '../home/widgets/todays_weather_card.dart';
import '../widgets/gradient_background.dart';

class CityWeatherPage extends StatefulWidget {
  const CityWeatherPage({
    super.key,
    required this.city,
  });
  final CityInfo city;

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  final weatherRepo = MetroWeatherRepo();

  Future<(MetroApiResponse?, String?)?> _loadData() async {
    final payload = MetroWeatherPayload(
      latitude: widget.city.latitude,
      longitude: widget.city.longitude,
      hourlyItems: HourlyItem.defaultItems,
    );
    debugPrint("payload ${payload.toString()}");
    return await weatherRepo.fetchWeather(payload);
  }

  late Future<(MetroApiResponse?, String?)?> future = _loadData();

  String get location => widget.city.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error.toString()}");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData == true) {
              final result = snapshot.data!;

              if (result.$2 != null || result.$1 == null) return Text(result.$2?.toString() ?? "something went wrong");

              return SearchedCityDetailsView(
                data: result.$1!,
                cityInfo: widget.city,
              );
            }

            return const Center(
              child: Text("Ugh..Na state"),
            );
          },
        ),
      ),
    );
  }
}
