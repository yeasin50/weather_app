import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../common/common.dart';
import '../common/models/models.dart';

/// shows a specific daily weather item for a day
/// Top shows duePoint but graphs for humidity
class HumidityGraph extends StatefulWidget {
  const HumidityGraph({
    super.key,
    required this.humidityData,
    required this.duePointsData,
  });

  final List<WeatherMeasurement> humidityData;
  final List<WeatherMeasurement> duePointsData;

  static void show({
    required BuildContext context,
    required List<WeatherMeasurement> humidityData,
    required List<WeatherMeasurement> duePointsData,
  }) {
    assert(humidityData.length == 24);
    assert(duePointsData.length == 24);

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
                Text("Humidity", style: TextTheme.of(context).labelMedium),
                Spacer(),
                IconButton(
                  onPressed: () {
                    ///TODO:  nav to full details page
                  },
                  icon: Icon(Icons.open_in_full_outlined),
                ),
              ],
            ),
            HumidityGraph(
              humidityData: humidityData,
              duePointsData: duePointsData,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<HumidityGraph> createState() => _HumidityChartState();
}

class _HumidityChartState extends State<HumidityGraph> {
  List<Color> gradientColors = HumidityDuePointData.humidityColors.reversed
      .toList();

  bool showAvg = false;
  List<FlSpot> spots = [];

  double get maxY => 100;

  late WeatherMeasurement maxDuePoint = widget.duePointsData.first;
  late WeatherMeasurement maxHumidity = widget.humidityData.first;

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
    calculateSpots();
    onChartHover(null);
  }

  String humidityLabel = "Max";
  String title = "maximum due point";
  double duePointValue = 0;

  void onChartHover(int? hoveredHour) {
    late WeatherMeasurement humidity, duePoint;

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
    duePointValue = double.parse(duePoint.value);

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
                          text: UserFormatter.temp(duePointValue, 0),
                          style: style.titleLarge,
                        ),
                        WidgetSpan(child: SizedBox(width: 6)),
                        TextSpan(text: humidityLabel, style: style.bodyLarge),
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
    final date = widget.humidityData.elementAtOrNull(value.toInt())?.time;
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
