import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/domain/entity/weather_record.dart';
import '/src/presentation/home/widgets/app_bar.dart';
import '../common/common.dart';
import '../provider/providers.dart';
import 'empty_city_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CityWeatherNotifier>(
      builder: (context, data, child) {
        final city = data.city;
        final title = city.name + ", " + city.countryCode; //TODO: update view
        if (city == CityRecord.none) return EmptyCityView();

        return Scaffold(
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Column(
              children: [
                HomeAppBar(title: title),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
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
                              spacing: 16,
                              children: [
                                TodaysWeather(),
                                HourlyForecastListView(),
                                ForecastHorizontalListview<DailyForecast>(
                                  data: data.weeklyForecast,
                                ),
                                SizedBox(height: 48),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
