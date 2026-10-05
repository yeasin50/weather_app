import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../uv_index/humidity_graph.dart';
import '../uv_index/perception_graph.dart';
import '../uv_index/uvindex_graph.dart';
import '../common/models/models.dart';
import '../uv_index/visibility_graph.dart';
import '../uv_index/wind_graph.dart';
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
        final title = "${city.name}, ${city.countryCode}"; //TODO: update view

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
    final boxWidth = MediaQuery.sizeOf(context).width / 2 - 24;
    return Consumer<CityWeatherNotifier>(
      builder: (context, value, child) {
        final hourData = value.selectedHourForcast;
        final uv = UVIndexParser(hourData.forecast.uvIndex);

        final sun = value.sundata;
        final moon = value.moonData;
        final precipitation = value.preceptionData;
        final wind = value.wind;
        final visibility = VisibilityData(hourData.forecast.visibility);

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            DailyWeatherCard(
              title: "UV index",
              icon: Icon(Icons.lightbulb_outlined, size: 16),
              value: uv.value.toString(),
              description: uv.level,
              unit: "",
              shape: UVIndexShape(uv.colorIndex, colors: UVIndexParser.colors),
              onTap: () {
                final data = value.fullDayforecast(.uvIndex);
                UVIndexChart.show(context: context, data: data);
              },
            ),

            HumadityView(
              data: value.humidityData,
              onTap: () {
                HumidityGraph.show(
                  context: context,
                  humidityData: value.fullDayforecast(.relativeHumidity),
                  duePointsData: value.fullDayforecast(.dewPoint),
                );
              },
            ),

            SunView(rise: sun.rise, down: sun.fall, progress: sun.progress),
            SunView(
              isSun: false,
              rise: moon.rise,
              down: moon.fall,
              progress: moon.progress,
              phase: moon.phase.label,
              moonfraction: moon.moonFraction,
            ),

            DailyWeatherCard(
              title: "perception",
              icon: Icon(Icons.water_outlined),
              value: precipitation.value + precipitation.unit,
              description: precipitation.description,
              unit: '',
              onTap: () {
                PrecipitationGraph.show(
                  context: context,
                  rainData: value.fullDayforecast(.rain),
                  percipitationData: value.fullDayforecast(
                    .precipitationProbability,
                  ),
                );
              },
              shape: RoundedRectangleBorder(borderRadius: .circular(24)),
            ),

            DailyWeatherCard(
              title: "Wind",
              icon: Icon(Icons.wind_power),
              value: wind.value,
              description: wind.description,
              unit: wind.unit,
              painter: WindShapePainter(wind.rotation, wind.color),
              onTap: () {
                WindGraph.show(
                  context: context,
                  windSpeed: value.fullDayforecast(.windSpeed),
                  windGusts: value.fullDayforecast(.windGusts),
                  windDirection: value.fullDayforecast(.windDirection),
                );
              },
            ),

            DailyWeatherCard(
              title: "Visiblity",
              icon: Icon(Icons.visibility_outlined),
              value: visibility.value,
              unit: visibility.unit,
              description: visibility.label,
              painter: VisibilityPainter(visibility.color),
              onTap: () {
                VisibilityGraph.show(
                  context: context,
                  data: value.fullDayforecast(.visiblity),
                );
              },
            ),
          ].map((e) => SizedBox.square(dimension: boxWidth, child: e)).toList(),
        );
      },
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: [
          DailyWeatherCard(
            // Diff api
            title: "Air quality",
            icon: Icon(Icons.air),
            value: "150",
            description: "Very unhealthy",
            unit: "",
            onTap: () {},
          ),

          DailyWeatherCard(
            title: "Pressure",

            /// idc
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
