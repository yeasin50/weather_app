import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/app/route_config.dart';
import 'package:weather_app/src/presentation/home/widgets/app_nav_bar.dart';
import 'package:weather_app/src/presentation/saved_city/widgets/saved_city_appbar.dart';

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

  void onTabChange(int index) {
    if (index == 2) {
      context.push(AppRoute.savedPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavBar(
        onTap: onTabChange,
      ),
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
          const Align(
            alignment: Alignment(0, -.75),
            child: TodaysWeather(
              temp: 33,
              humidity: 23,
              rain: 12,
              location: "location",
              mood: "mode",
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: HomeWeatherBottomSheet(),
          )
        ],
      ),
    );
  }
}
