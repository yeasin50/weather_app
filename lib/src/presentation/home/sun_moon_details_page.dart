import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/presentation/common/common.dart';
import '../provider/providers.dart';

class SunMoonDetailsPage extends StatefulWidget {
  const SunMoonDetailsPage({super.key});

  @override
  State<SunMoonDetailsPage> createState() => _SunMoonDetailsPageState();
}

class _SunMoonDetailsPageState extends State<SunMoonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CityWeatherNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: [
              /// ...
              Text(value.city.name.toString()),

              for (final d in value.weeklyForecast)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _WeeklyForecastTile(dailyForecast: d),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _WeeklyForecastTile extends StatelessWidget {
  const _WeeklyForecastTile({super.key, required this.dailyForecast});
  final DailyForecast dailyForecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: .stretch,
      children: [
        // Text(dailyForecast.time.toString()),
        Text("sunRise ${dailyForecast.sunrise.formatValue}"),
        Text("sunset  ${dailyForecast.sunset.formatValue}"),
      ],
    );
  }
}
