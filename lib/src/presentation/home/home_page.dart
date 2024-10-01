import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/infrastructure/weather_repo.dart';
import '../../app/route_config.dart';
import '../../infrastructure/infrastructure.dart';
import 'widgets/app_nav_bar.dart';

import '../../domain/domain.dart';
import '../widgets/gradient_background.dart';
import 'widgets/my_city_weather_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    localDB.dispose();
    super.dispose();
  }

  MetroApiResponse? weatherData;
  HourlyWeatherInfo? get todaysWeather => weatherData?.getWeather(DateTime.now());

  void onTabChange(int index) async {
    if (index == 1) {
    } else if (index == 2) {
      context.push(AppRoute.savedPage);
    } else if (index == 0) {
      await context.push(AppRoute.searchCity);
    }
  }

  late final addMyCityButton = Align(
    alignment: const Alignment(0, .65),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          shape: const StadiumBorder(),
          fixedSize: const Size(220, 64)),
      onPressed: () => onTabChange(0),
      child: const Text("Find My City"),
    ),
  );

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
          StreamBuilder(
            stream: localDB.myCityInfo,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return snapshot.data == null ? addMyCityButton : MyCityWeatherView(city: snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
