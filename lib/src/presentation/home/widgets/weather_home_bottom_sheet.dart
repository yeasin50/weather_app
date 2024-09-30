import 'package:flutter/material.dart';

import '../../../infrastructure/infrastructure.dart';

import '../../common/widgets/hourly_weekly_forecast_view.dart';

class HomeWeatherBottomSheet extends StatelessWidget {
  const HomeWeatherBottomSheet({
    super.key,
    required this.hourlyForecast,
    required this.weeklyForecast,
  });

  final List<HourlyWeatherInfo> hourlyForecast;
  final List<HourlyWeatherInfo> weeklyForecast;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * .6),
          HourWeeklyForecastView(
            hourlyForecast: hourlyForecast,
            weeklyForecast: weeklyForecast,
          ),
        ],
      ),
    );
  }
}
