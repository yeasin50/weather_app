import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/searched_city_details_view.dart';

import '../../domain/domain.dart';
import '../../infrastructure/repository/metro_weather_repo.dart';
import '../widgets/gradient_background.dart';

class CityWeatherPage extends StatefulWidget {
  const CityWeatherPage({
    super.key,
    required this.city,
    required this.showDeleteButton, 
  });
  final CityInfo city;
  final bool showDeleteButton; 

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
    // Get the extra data, safely casting to the expected type
    final route = GoRouter.of(context);
    final extra = route.routerDelegate.currentConfiguration.extra;
    print("extra ${extra} ${route.routerDelegate.currentConfiguration.fullPath}");
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: Column(
          children: [
            AppBar(backgroundColor: Colors.transparent),
            Expanded(
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

                    if (result.$2 != null || result.$1 == null) {
                      return Text(result.$2?.toString() ?? "something went wrong");
                    }

                    return SearchedCityDetailsView(
                      data: result.$1!,
                      cityInfo: widget.city,
                      showDeleteButton : widget.showDeleteButton,
                    );
                  }

                  return const Center(
                    child: Text("Ugh..Na state"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
