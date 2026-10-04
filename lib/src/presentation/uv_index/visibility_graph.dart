import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../common/common.dart';
import '../common/models/models.dart';
import 'common.dart';

/// shows a specific daily weather item for a day
/// FOR Wind speed, gusts, direction
class VisibilityGraph extends StatefulWidget {
  const VisibilityGraph({super.key, required this.data});

  final List<WeatherMeasurement> data;

  static void show({
    required BuildContext context,
    required List<WeatherMeasurement> data,
  }) {
    assert(data.length == 24);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: .min,
          spacing: 24,
          children: [
            //something
            DialogTitle(
              title: "Visibility",
              onTap: () {
                //Todo: nav to full view
              },
            ),
            VisibilityGraph(data: data),
          ],
        ),
      ),
    );
  }

  @override
  State<VisibilityGraph> createState() => _VisibilityGraphState();
}

class _VisibilityGraphState extends State<VisibilityGraph> with ChartMixin {
  late List<Color> gradientColors = WindData.colors(maxY);

  List<FlSpot> visiblitySpots = [];

  double get maxY => double.parse(maxVisiblity.value) + 1;

  late WeatherMeasurement maxVisiblity = widget.data.first;
  late WeatherMeasurement minVisiblity = widget.data.first;

  void calculateSpots() {
    for (int i = 0; i < widget.data.length; i++) {
      final item = widget.data[i];
      final double value =
          double.tryParse(item.value) ?? 0; // parse specific format km
      visiblitySpots.add(FlSpot(item.time.hour.toDouble(), value.toDouble()));

      if (double.parse(maxVisiblity.value) < value) maxVisiblity = item;
      if (double.parse(minVisiblity.value) > value) minVisiblity = item;
    }
  }

  @override
  void initState() {
    super.initState();
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

    visibilityabel = UserFormatter.wind(double.parse(item.value));
    labelSmall =
        "${item.unit}"; //TODO: wonder what will be good way  to have unit from parser

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
          aspectRatio: 1.70, //FIXME:  better view must check  footer
          child: Padding(
            padding: const EdgeInsets.only(left: 26),
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
}
