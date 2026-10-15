import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/domain.dart';
import '../../models/models.dart';
import 'common.dart';

/// shows a specific daily weather item for a day
class UVIndexChart extends StatefulWidget {
  final List<WeatherMeasurement> data;

  const UVIndexChart({super.key, required this.data});

  @override
  State<UVIndexChart> createState() => _UVIndexChartState();
}

class _UVIndexChartState extends State<UVIndexChart> with ChartMixin {
  List<Color> gradientColors = UVIndexParser.colors;

  bool showAvg = false;
  List<FlSpot> spots = [];

  late WeatherMeasurement maxUVIndex = widget.data.first;

  String uvIndexLabel = "Max";
  String title = "maximum value";

  double indexValue = 0;

  double get maxY => math.max(double.parse(maxUVIndex.value) + 2, 9);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        buildValueIndicator(
          title: title,
          value: indexValue.toStringAsFixed(1),
          trailingValue: uvIndexLabel,
        ),

        AspectRatio(
          aspectRatio: chartAspectRatio,
          child: Padding(padding: chartPadding, child: LineChart(mainData())),
        ),
      ],
    );
  }

  void calculateSpots() {
    for (final d in widget.data) {
      final double value = double.tryParse(d.value) ?? 0;
      spots.add(FlSpot(d.time.hour.toDouble(), value));

      if (double.parse(maxUVIndex.value) < value) maxUVIndex = d;
    }
  }

  @override
  void initState() {
    super.initState();
    assert(widget.data.length == 24);
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
            reservedSize: 24,
            interval: 3,
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
                bottomTitleWidgets(value, meta, data: widget.data),
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
    late UVIndexParser item;

    if (hoveredHour == null) {
      item = UVIndexParser(maxUVIndex);
      title = "Maximum value";
    } else {
      final data = widget.data.elementAt(hoveredHour);
      item = UVIndexParser(data);
      title = DateFormat("h:mm a").format(data.time);
    }

    uvIndexLabel = item.level;
    indexValue = item.value;
    setState(() {});
  }
}
