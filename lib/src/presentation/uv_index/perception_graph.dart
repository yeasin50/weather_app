import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../common/models/models.dart';
import 'common.dart';

/// shows a specific daily weather item for a day
/// FOR Precipitation with Rain
class PrecipitationGraph extends StatefulWidget {
  const PrecipitationGraph({
    super.key,
    required this.rainData,
    required this.percipitationData,
  });

  final List<WeatherMeasurement> percipitationData;
  final List<WeatherMeasurement> rainData;

  static void show({
    required BuildContext context,
    required List<WeatherMeasurement> rainData,
    required List<WeatherMeasurement> percipitationData,
  }) {
    assert(rainData.length == 24);
    assert(percipitationData.length == 24);

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
              title: "Percipitation",
              onTap: () {
                //Todo: nav to full view
              },
            ),

            PrecipitationGraph(
              rainData: rainData,
              percipitationData: percipitationData,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<PrecipitationGraph> createState() => _PrecipitationGraphState();
}

class _PrecipitationGraphState extends State<PrecipitationGraph>
    with ChartMixin {
  List<Color> gradientColors = PreceptionInfo.colors;

  List<FlSpot> spots = [];

  double get maxY => 100;

  late WeatherMeasurement maxPercipitation = widget.percipitationData.first;
  late WeatherMeasurement maxRain = widget.rainData.first;

  void calculateSpots() {
    for (int i = 0; i < widget.percipitationData.length; i++) {
      final d = widget.percipitationData[i];
      final int value = int.tryParse(d.value) ?? 0;
      spots.add(FlSpot(d.time.hour.toDouble(), value.toDouble()));

      if (double.parse(maxPercipitation.value) < value) maxPercipitation = d;

      if (double.parse(maxRain.value) <
          double.parse(widget.rainData[i].value)) {
        maxRain = widget.rainData[i];
      }
    }
  }

  @override
  void initState() {
    super.initState();
    calculateSpots();
    onChartHover(null);
  }

  String timeLabel = "hh:mm a";
  String rainLabel = "x in";
  double percipitationValue = 0;

  void onChartHover(int? hoveredHour) {
    late WeatherMeasurement percipitation, rain;

    if (hoveredHour == null) {
      percipitation = maxPercipitation;
      timeLabel = "Maximum percipitation";
      rain = maxRain;
    } else {
      percipitation = widget.percipitationData.elementAt(hoveredHour);
      timeLabel = DateFormat("h:mm a").format(percipitation.time);
      rain = widget.rainData.elementAt(hoveredHour);
    }

    rainLabel = "chance · ${double.parse(rain.value)} ${rain.unit} rain";
    percipitationValue = double.parse(percipitation.value);

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
          value: "${percipitationValue.toStringAsFixed(1)}%",
          trailingValue: rainLabel,
        ),
        AspectRatio(
          aspectRatio: 1.70, //FIXME:  better view must check  footer
          child: Padding(
            padding: const EdgeInsets.only(left: 26),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
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
                bottomTitleWidgets(value, meta, data: widget.percipitationData),
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
}
