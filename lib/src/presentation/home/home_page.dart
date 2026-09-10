import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/common/widgets/app_button.dart';
import 'package:weather_app/src/presentation/home/widgets/app_bar.dart';
import '../../infrastructure/infrastructure.dart';

import '../../domain/domain.dart';
import '../widgets/gradient_background.dart';
import 'widgets/my_city_weather_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MetroApiResponse? weatherData;
  HourlyWeatherInfo? get todaysWeather =>
      weatherData?.getCurrentHourWeather(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      isImage: true,
      child: StreamBuilder(
        stream: localDB.myCityInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final title =
              snapshot.data?.name ==
                  null //
              ? "Search city"
              : "${snapshot.data!.name}, ${snapshot.data?.country}";

          return Scaffold(
            drawer: AppDrawer(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: HomeAppBar(title: title),
                ),
                Expanded(
                  child:
                      snapshot.data ==
                          null //
                      ? Align(
                          alignment: const Alignment(0, .65),
                          child: AppButton.header(
                            label: "Find My City",
                          ), //TODO: missing tap
                        )
                      : MyCityWeatherView(city: snapshot.data!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
