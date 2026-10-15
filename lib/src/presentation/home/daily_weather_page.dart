import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../common/common.dart';
import '../common/models/models.dart';
import '../common/widgets/charts/charts_view.dart';
import '../common/widgets/charts/temperature_graph.dart';
import '../provider/providers.dart';

/// it can takes a selected day  and shows full day  each  section(temp, uvIndex....)
class DailyWeatherPage extends StatefulWidget {
  const DailyWeatherPage({super.key, required this.date});

  /// it can accept any date with or without time,
  /// internally handle dateOnly to preview the day data
  final DateTime date;

  @override
  State<DailyWeatherPage> createState() => _DailyWeatherPageState();
}

class _DailyWeatherPageState extends State<DailyWeatherPage> {
  /// ....
  late final days = context.read<CityWeatherNotifier>().data;

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);

    return DefaultTabController(
      length: days.sevenDaysDailyRecord.length,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: days.sevenDaysDailyRecord
                  .map(
                    (e) => Tab(
                      height: 96,
                      child: Align(
                        child: Column(
                          mainAxisSize: .min,
                          spacing: 4,
                          children: [
                            Text(
                              e.time.day.toString(),
                              style: style.titleMedium?.copyWith(fontSize: 16),
                            ),
                            Text(DateFormat.E().format(e.time)),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  for (final d
                      in days.sevenDaysDailyRecord.map((e) => e).toList())
                    _DailyWeatherView(day: d.time),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyWeatherView extends StatelessWidget {
  const _DailyWeatherView({required this.day});

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    late final records = context.read<CityWeatherNotifier>().data;

    List<WeatherMeasurement> getData(MeasurementType type) =>
        records.fullDayforecast(type, day);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 24,
        children: [
          SizedBox(height: 16),
          // sunRize and set
          /// ...
          /// temp+feels like
          /// rain stuff if possible merge at top
          /// humidity
          // uvIndex
          // wind
          // visibility
          TemperatureGraph(
            tempData: getData(.temperature),
            feelsLikeData: getData(.tempFeelsLike),
          ),
          HumidityGraph(
            humidityData: getData(.relativeHumidity),
            duePointsData: getData(.dewPoint),
          ),
          PrecipitationGraph(
            rainData: getData(.rain),
            percipitationData: getData(.precipitationProbability),
          ),
          WindGraph(
            windGusts: getData(.windGusts),
            windSpeed: getData(.windSpeed),
            windDirection: getData(.windDirection),
          ),

          VisibilityGraph(data: getData(.visiblity)),
        ],
      ),
    );
  }
}
