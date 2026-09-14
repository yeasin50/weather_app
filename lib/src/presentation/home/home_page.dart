import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/infrastructure/weather_provider.dart';
import 'package:weather_app/src/presentation/common/widgets/app_button.dart';
import 'package:weather_app/src/presentation/home/widgets/app_bar.dart';
import '../../app/route_config.dart';

import '../widgets/gradient_background.dart';
import 'widgets/my_city_weather_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      isImage: true,
      child: Consumer<WeatherNotifier>(
        builder: (context, data, child) {
          final todayRecord = data.todayWeather;
          final title = todayRecord == null
              ? "Search city"
              : "{todayRecord.name}, {todayRecord.country}";

          return Scaffold(
            drawer: AppDrawer(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: HomeAppBar(title: title),
                ),
                Expanded(
                  child: todayRecord == null
                      ? Align(
                          alignment: const Alignment(0, .65),
                          child: AppButton.header(
                            label: "Find My City",
                            onTap: () => context.push(AppRoute.searchCity),
                          ),
                        )
                      : MyCityWeatherView(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
