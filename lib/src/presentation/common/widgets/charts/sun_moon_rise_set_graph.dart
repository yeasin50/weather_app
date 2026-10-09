import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../domain/domain.dart';
import '../../../provider/providers.dart';
import 'common.dart';

/// Shows all  day sun-moon rise fall, kinda sloppy graph,
/// might gonna use [CustomPaint] instead
class SunMoonChart extends StatefulWidget {
  const SunMoonChart({super.key, this.graphScrollController});

  final ScrollController? graphScrollController;

  @override
  State<SunMoonChart> createState() => _SunMoonChartState();
}

class _SunMoonChartState extends State<SunMoonChart> with ChartMixin {
  late double startX, endX;
  late List<FlSpot> sunSpots;
  late List<FlSpot> moonSpots;

  final sunColor = Colors.amberAccent;
  final moonColor = Colors.blueGrey;

  double minuteSinceEpoch(WeatherMeasurement wm) {
    return DateTime.parse(wm.value).millisecondsSinceEpoch / 60000;
  }

  void calculateSpots() {
    sunSpots = [];
    moonSpots = [];

    late final dailyWeathers = context
        .read<CityWeatherNotifier>()
        .weeklyForecast;

    for (final w in dailyWeathers) {
      final sunRise = minuteSinceEpoch(w.sunrise);
      final sunSet = minuteSinceEpoch(w.sunset);
      final dayDuration = sunSet - sunRise;

      sunSpots.add(FlSpot(sunRise, 0));
      sunSpots.add(FlSpot(sunRise + dayDuration / 2, 1));
      sunSpots.add(FlSpot(sunSet, 0));
      sunSpots.add(FlSpot(sunSet + dayDuration / 2, -1));

      final moonRise = minuteSinceEpoch(w.moonRise);
      final moonSet = minuteSinceEpoch(w.moonSet);

      final moonDuration = moonSet - moonRise;

      moonSpots.add(FlSpot(moonRise, 0));
      moonSpots.add(FlSpot(moonRise + moonDuration / 2, 1));
      moonSpots.add(FlSpot(moonSet, 0));
      moonSpots.add(FlSpot(moonSet + moonDuration / 2, -1));
    }

    final allSpots = [...sunSpots, ...moonSpots];
    startX = allSpots.map((e) => e.x).reduce(min);
    endX = allSpots.map((e) => e.x).reduce(max);
  }

  Widget timeTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white);

    DateTime date = DateTime.fromMillisecondsSinceEpoch(value.toInt() * 60000);
    String text = date.hour % 6 != 0 ? "" : DateFormat("hh:mm a").format(date);

    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  @override
  void initState() {
    super.initState();
    calculateSpots();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        controller: widget.graphScrollController,
        padding: const .only(left: 12, bottom: 12, right: 20, top: 20),
        child: SizedBox(
          height: 400 + 24,
          width: 500 * 7,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: false),
              lineBarsData: [
                // The order is intentional, don't change it
                LineChartBarData(
                  spots: moonSpots,
                  barWidth: 0,
                  isCurved: true,
                  isStrokeCapRound: false,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    applyCutOffY: true,
                    cutOffY: 0,
                    gradient: LinearGradient(
                      // stops: [0, .25],
                      begin: .topCenter,
                      end: .bottomCenter,
                      colors: [
                        moonColor.withAlpha(70),
                        Colors.transparent, //FIXME: Gradient doesn't work
                      ],
                    ),
                  ),
                ),

                LineChartBarData(
                  spots: sunSpots,
                  barWidth: 0,
                  isCurved: true,
                  isStrokeCapRound: false,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    applyCutOffY: true,
                    cutOffY: 0,
                    gradient: LinearGradient(
                      // stops: [0, .25],
                      begin: .topCenter,
                      end: .bottomCenter,
                      colors: [
                        sunColor.withAlpha(70),
                        Colors.transparent, //FIXME: Gradient doesn't work
                      ],
                    ),
                  ),
                ),
                LineChartBarData(
                  spots: moonSpots,
                  isCurved: true,
                  isStrokeCapRound: true,
                  barWidth: 2,
                  belowBarData: BarAreaData(show: false),
                  dotData: const FlDotData(show: false),
                  color: Colors.blueGrey,
                ),

                LineChartBarData(
                  spots: sunSpots,
                  color: sunColor,
                  isCurved: true,
                  isStrokeCapRound: true,
                  barWidth: 2,
                  belowBarData: BarAreaData(show: false),
                  dotData: const FlDotData(show: false),
                ),
              ],
              minY: 1,
              maxY: -1,
              minX: startX,
              maxX: endX,
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitleAlignment: .outside,
                  drawBelowEverything: true,
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: timeTitleWidgets,
                    interval: 6 * 60.0,
                    reservedSize: 24,
                    minIncluded: true,
                    maxIncluded: true,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                verticalInterval: 360, // every 6 hours
                horizontalInterval: 0.25,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (v) => FlLine(color: Colors.grey),
                // getDrawingVerticalLine: (v) => FlLine(color: Colors.grey),
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ),
    );
  }
}
