import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../../domain/domain.dart';

import 'package:flutter/material.dart';

import '../common/models/models.dart';

/// shows a specific daily weather item for a day
class UVIndexChart extends StatefulWidget {
  const UVIndexChart({super.key, required this.data});

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
            Row(
              children: [
                Text("UV index", style: TextTheme.of(context).labelMedium),
                Spacer(),
                IconButton(
                  onPressed: () {
                    ///TODO:  nav to full details page
                  },
                  icon: Icon(Icons.open_in_full_outlined),
                ),
              ],
            ),
            UVIndexChart(data: data),
          ],
        ),
      ),
    );
  }

  @override
  State<UVIndexChart> createState() => _UVIndexChartState();
}

class _UVIndexChartState extends State<UVIndexChart> {
  List<Color> gradientColors = UVIndexParser.colors;

  bool showAvg = false;
  List<FlSpot> spots = [];

  double get maxY => math.max(double.parse(maxUVIndex.value) + 2, 9);

  late WeatherMeasurement maxUVIndex = widget.data.first;
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
    calculateSpots();
  }

  String uvIndexLabel = "Max";
  String title = "maximum value";
  double indexValue = 0;

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

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        Row(
          spacing: 12,
          children: [
            Material(
              shape: CircleBorder(),
              color: Colors.greenAccent,
              child: SizedBox.square(dimension: 16),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 2,
                children: [
                  Text(title, style: style.bodySmall),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: indexValue.toStringAsFixed(1),
                          style: style.titleLarge,
                        ),
                        WidgetSpan(child: SizedBox(width: 6)),
                        TextSpan(text: uvIndexLabel, style: style.bodyLarge),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle();
    final date = widget.data.elementAtOrNull(value.toInt())?.time;
    String text = date == null || date.hour % 6 != 0
        ? ""
        : DateFormat("hh:mm a").format(date);
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle();

    final rounded = value.round();
    if ((value - rounded).abs() > 0.001 || rounded % 3 != 0) {
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(value.toStringAsFixed(0), style: style),
    );
  }

  LineTouchData get lineTouchdate => LineTouchData(
    enabled: true,
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      getTooltipItems: (spots) => spots.map((spot) => null).toList(),
    ),
    touchCallback: (FlTouchEvent event, LineTouchResponse? lineTouch) {
      if (event is FlPointerExitEvent ||
          event is FlPanEndEvent ||
          event is FlLongPressEnd) {
        onChartHover(null);
        return;
      }
      if (lineTouch?.lineBarSpots?.isNotEmpty == true) {
        final value = lineTouch!.lineBarSpots![0].x;
        onChartHover(value.toInt());
      }
    },
  );

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
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: maxY,
      lineTouchData: lineTouchdate,
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
