import 'package:flutter/material.dart';
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
  HourlyWeatherInfo? get todaysWeather => weatherData?.getCurrentHourWeather(DateTime.now());

  late final addMyCityButton = Align(
    alignment: const Alignment(0, .65),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          shape: const StadiumBorder(),
          fixedSize: const Size(220, 64)),
      onPressed: () {
        //
      },
      child: const Text("Find My City"),
    ),
  );

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

            final title = snapshot.data?.name == null //
                ? "Search city"
                : "${snapshot.data!.name}, ${snapshot.data?.country}";

            return Scaffold(
              appBar: HomeAppBar(
                title: title,
              ),
              body: snapshot.data == null //
                  ? addMyCityButton
                  : MyCityWeatherView(
                      city: snapshot.data!,
                    ),
            );
          },
        ));
  }
}
