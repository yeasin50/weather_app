import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/route_config.dart';
import '../../infrastructure/infrastructure.dart';
import 'widgets/app_nav_bar.dart';

import '../../domain/domain.dart';
import '../widgets/gradient_background.dart';
import 'widgets/todays_weather_card.dart';
import 'widgets/weather_home_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MetroApiResponse> items = [];
  final MetroWeatherRepo repo = MetroWeatherRepo();

  MetroApiResponse? weatherData;
  HourlyWeatherInfo? get todaysWeather => weatherData?.getWeather(DateTime.now());

  Future getWeather() async {
    final payload = MetroWeatherPayload(
      latitude: 23.7104,
      longitude: 90.40744,
      hourlyItems: HourlyItem.defaultItems,
    );
    final result = await repo.fetchWeather(payload);
    weatherData = result.$1!;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  void onTabChange(int index) {
    if (index == 1) {
      getWeather();
    } else if (index == 2) {
      context.push(AppRoute.savedPage);
    } else if (index == 0) {
      context.push(AppRoute.searchCity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavBar(onTap: onTabChange),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const GradientBackground(isImage: true, child: SizedBox.expand()),
          Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Image.asset(
                "assets/images/house.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -.75),
            child: TodaysWeather(
              temp: todaysWeather?.temperature ?? 0,
              humidity: todaysWeather?.humidity ?? 0,
              rain: todaysWeather?.rain.toInt() ?? 0,
              location: "location",
              mood: todaysWeather?.mood.label ?? "",
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: HomeWeatherBottomSheet(
              hourlyForecast: weatherData?.todaysHourlyForecast ?? [],
              weeklyForecast: weatherData?.weeklyForecast ?? [],
            ),
          )
        ],
      ),
    );
  }
}
