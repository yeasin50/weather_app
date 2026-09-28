import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/widgets/daily_cards/air_quality_view.dart';
import '../common/widgets/daily_cards/daily_card_wrapper.dart';
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
                                // HourlyForecastListView(),
                                // ForecastHorizontalListview<DailyForecast>(
                                //   data: data.weeklyForecast,
                                // ),
                                SizedBox(height: 48),
                                DailyForecastItems(),
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

class DailyForecastItems extends StatelessWidget {
  const DailyForecastItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        HumadityView(measurement: WeatherMeasurement.emptyW),
        UvindexView(uvIndex: WeatherMeasurement.emptyW),
        SunMoonView(rise: DateTime.now(), down: DateTime.now()),
        SunMoonView(rise: DateTime.now(), down: DateTime.now(), isSun: false),
        DailyWeatherCard(
          title: "Air quality",
          icon: Icon(Icons.air),
          value: "150",
          description: "Very unhealthy",
          unit: "",
          onTap: () {},
        ),

        DailyWeatherCard(
          title: "Visiblity",
          icon: Icon(Icons.visibility_outlined),
          value: "5.9",
          unit: "mi",
          description: "Moderate",
          onTap: () {},
        ),

        DailyWeatherCard(
          title: "Pressure",
          icon: Icon(Icons.electric_meter),
          value: "29.79",
          unit: "",
          description: "inHg",
          onTap: () {},
        ),
      ].map((e) => SizedBox.square(dimension: 250, child: e)).toList(),
    );
  }
}
