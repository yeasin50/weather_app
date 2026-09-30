import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../infrastructure/infrastructure.dart';
import '/src/presentation/common/widgets/daily_cards/wind_shape_painter.dart';

import '../common/widgets/daily_cards/daily_weather_card.dart';
import '../common/widgets/daily_cards/visibility_painter.dart';
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
                                // TodaysWeather(),
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
    return Consumer<CityWeatherNotifier>(
      builder: (context, value, child) {
        final hourData = value.selectedHourForcast;
        final uv = UVIndexParser(hourData.forecast.uvIndex);

        //FIXME: value aren't good, have some confusion how api  providing me
        final sunRise = DateTime.parse(hourData.dayForecast.sunrise.value);
        final sunSet = DateTime.parse(hourData.dayForecast.sunset.value);

        final moonRise = DateTime.tryParse(hourData.dayForecast.moonRise.value);
        final moonSet = DateTime.tryParse(hourData.dayForecast.moonSet.value);

        final moon = value.moonRiseFall; // TODO: AM  I missing something

        return Column(
          spacing: 24,
          children: [
            DailyWeatherCard(
              title: "UV index",
              icon: Icon(Icons.sunny),
              value: uv.value.toString(),
              description: uv.level,
              unit: "",
              shape: UVIndexShape(uv.colorIndex, colors: UVIndexParser.colors),
              onTap: () {},
            ),

            SunView(rise: sunRise, down: sunSet),
            MoonView(
              previousRise: moon.prevDayRise,
              todayRise: moon.todayRise,
              todayDown: moon.todayFall,
              // todayRise: DateTime.now().subtract(Duration(hours: 5)),
              // todayDown: DateTime.now().add(Duration(hours: 12)),
            ),
          ].map((e) => SizedBox.square(dimension: 250, child: e)).toList(),
        );
      },
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: [
          HumadityView(measurement: WeatherMeasurement.emptyW),

          DailyWeatherCard(
            title: "Perception",
            icon: Icon(Icons.water_outlined),
            value: "0.04",
            description: "no rain for 2 hours",
            unit: "in",
            onTap: () {},
            shape: RoundedRectangleBorder(borderRadius: .circular(24)),
          ),

          DailyWeatherCard(
            title: "Wind",
            icon: Icon(Icons.wind_power),
            value: "3",
            description: "Gust: 5mph",
            unit: "mph",
            painter: WindShapePainter(),
            onTap: () {},
          ),

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
            painter: VisibilityPainter(),
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
      ),
    );
  }
}
