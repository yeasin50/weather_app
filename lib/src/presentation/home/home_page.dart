import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/home/widgets/app_nav_bar.dart';

import '../../domain/domain.dart';
import '../widgets/gradient_background.dart';
import '../widgets/weather_card_view.dart';
import 'widgets/todays_weather_card.dart';

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
      body: GradientBackground(
        isImage: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
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
            const Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
