import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/home/widgets/app_nav_bar.dart';

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

  void onTabChange(int index) {}
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
            alignment: const Alignment(0, -.45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TodaysWeather(
                  temp: 33,
                  humidity: 23,
                  rain: 12,
                  location: "location",
                  mood: "mode",
                ),
                Align(
                  child: FractionallySizedBox(
                    widthFactor: .75,
                    child: Image.asset(
                      "assets/images/house.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
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
