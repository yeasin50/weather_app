import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/domain.dart';
import '../../common.dart';
import '../../models/models.dart';
import 'common.dart';

/// shows a specific daily weather item for a day
/// FOR Wind speed, gusts, direction
class VisibilityGraph extends StatefulWidget {
  const VisibilityGraph({super.key, required this.data});

  final List<WeatherMeasurement> data;

  @override
  State<VisibilityGraph> createState() => _VisibilityGraphState();
}

class _VisibilityGraphState extends State<VisibilityGraph> with ChartMixin {
  late final gradient = VisibilityData.colors(double.parse(maxVisiblity.value));

  List<FlSpot> visiblitySpots = [];

  // if becomes more hassle , create a separate class
  double _parseValue(WeatherMeasurement wm) =>
      context.read<UserFormatter>().distanceValue(double.parse(wm.value));

  double get maxY => _parseValue(maxVisiblity) + 1;

  late WeatherMeasurement maxVisiblity = widget.data.first;
  late WeatherMeasurement minVisiblity = widget.data.first;

  void calculateSpots() {
    for (int i = 0; i < widget.data.length; i++) {
      final item = widget.data[i];
      final double value = _parseValue(item);

      visiblitySpots.add(FlSpot(item.time.hour.toDouble(), value));

      if (_parseValue(maxVisiblity) < value) maxVisiblity = item;
      if (_parseValue(minVisiblity) > value) minVisiblity = item;
    }
  }

  @override
  void initState() {
    super.initState();
    assert(widget.data.length == 24);
    calculateSpots();
    onChartHover(null);
  }

  String timeLabel = "hh:mm a";
  String visibilityabel = "12";
  String labelSmall = "km";

  void onChartHover(int? hoveredHour) {
    late WeatherMeasurement item;

    if (hoveredHour == null) {
      item = maxVisiblity;
      timeLabel = "Maximum visbility";
      // ...
    } else {
      item = widget.data.elementAt(hoveredHour);
      timeLabel = DateFormat("h:mm a").format(item.time);
    }

    final formatter = context.read<UserFormatter>();
    visibilityabel = formatter.distance(_parseValue(item));
    labelSmall = formatter.distanceUnit;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        buildValueIndicator(
          title: timeLabel,
          value: visibilityabel,
          trailingValue: labelSmall,
        ),
        AspectRatio(
          aspectRatio: chartAspectRatio,
          child: Padding(
            padding: chartPadding,
            child: LineChart(windSpeedData()),
          ),
        ),
      ],
    );
  }

  LineChartData windSpeedData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: yInterval(maxY),
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
          spots: visiblitySpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradient.colors.map((e) => e.withValues(alpha: 1)).toList(),
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
              stops: gradient.stops,
              colors: gradient.colors
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
