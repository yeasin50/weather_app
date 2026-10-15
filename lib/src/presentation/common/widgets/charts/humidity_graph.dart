import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '/src/domain/domain.dart';
import '../../common.dart';
import '../../models/models.dart';
import 'common.dart';

/// shows a specific daily weather item for a day
/// Top shows duePoint but graphs for humidity
class HumidityGraph extends StatefulWidget {
  final List<WeatherMeasurement> humidityData;

  final List<WeatherMeasurement> duePointsData;
  const HumidityGraph({
    super.key,
    required this.humidityData,
    required this.duePointsData,
  });

  @override
  State<HumidityGraph> createState() => _HumidityChartState();
}

class _HumidityChartState extends State<HumidityGraph> with ChartMixin {
  List<Color> gradientColors = HumidityDuePointData.humidityColors.reversed
      .toList();

  bool showAvg = false;
  List<FlSpot> spots = [];

  late WeatherMeasurement maxDuePoint = widget.duePointsData.first;

  late WeatherMeasurement maxHumidity = widget.humidityData.first;
  String humidityLabel = "Max";

  String title = "maximum due point";

  late WeatherMeasurement duePoint;

  double get maxY => 100;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        buildValueIndicator(
          title: title,
          value: context.read<UserFormatter>().temp(duePoint),
          trailingValue: humidityLabel,
        ),
        AspectRatio(
          aspectRatio: chartAspectRatio,
          child: Padding(padding: chartPadding, child: LineChart(mainData())),
        ),
      ],
    );
  }

  void calculateSpots() {
    for (int i = 0; i < widget.humidityData.length; i++) {
      final d = widget.humidityData[i];
      final int value = int.tryParse(d.value) ?? 0;
      spots.add(FlSpot(d.time.hour.toDouble(), value.toDouble()));

      if (double.parse(maxHumidity.value) < value) maxHumidity = d;

      if (double.parse(maxDuePoint.value) <
          double.parse(widget.duePointsData[i].value)) {
        maxDuePoint = widget.duePointsData[i];
      }
    }
  }

  @override
  void initState() {
    super.initState();
    assert(widget.humidityData.length == 24);
    assert(widget.duePointsData.length == 24);
    calculateSpots();
    onChartHover(null);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 20,
            getTitlesWidget: rightTitleWidgets,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                bottomTitleWidgets(value, meta, data: widget.humidityData),
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: maxY,
      lineTouchData: lineTouchdate(onChartHover),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors.map((e) => e.withValues(alpha: 1)).toList(),
            begin: .bottomCenter,
            end: .topCenter,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: .bottomCenter,
              end: .topCenter,
              colors: gradientColors
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  void onChartHover(int? hoveredHour) {
    late WeatherMeasurement humidity;

    if (hoveredHour == null) {
      humidity = maxHumidity;
      duePoint = maxDuePoint;
      title = "Maximum due point";
    } else {
      humidity = widget.humidityData.elementAt(hoveredHour);
      duePoint = widget.duePointsData.elementAt(hoveredHour);
      title = DateFormat("h:mm a").format(humidity.time);
    }

    humidityLabel = "on ${int.parse(humidity.value)}% humidity";

    setState(() {});
  }
}
