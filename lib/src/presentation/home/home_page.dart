import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/common.dart';
import '/src/domain/entity/weather_record.dart';
import '../provider/providers.dart';
import '/src/presentation/home/widgets/app_bar.dart';

import '../widgets/gradient_background.dart';
import 'empty_city_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CityWeatherNotifier>(
      builder: (context, data, child) {
        final city = data.city;
        final title = city.name;
        if (city == CityRecord.none) return EmptyCityView();

        return GradientBackground(
          child: Scaffold(
            appBar: HomeAppBar(title: title),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await context.read<WeatherNotifier>().refreshHomeCity();
                        await Future.delayed(Duration(seconds: 2));
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Consumer<CityWeatherNotifier>(
                          builder: (context, data, _) {
                            return Column(
                              crossAxisAlignment: .stretch,
                              spacing: 32,
                              children: [
                                TodaysWeather(),
                                ForecastHorizontalListview<HourlyForecast>(
                                  data: data.todaysHourlyForecast,
                                ),

                                ForecastHorizontalListview<DailyForecast>(
                                  data: data.weeklyForecast,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
