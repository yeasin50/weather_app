import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart' show WeatherMeasurement;
import '../../common.dart';
import '../../models/models.dart' show WindData;
import 'common.dart';

/// shows a specific daily weather item for a day
/// FOR Wind speed, gusts, direction
class WindGraph extends StatefulWidget {
  const WindGraph({
    super.key,
    required this.windGusts,
    required this.windSpeed,
    required this.windDirection,
  });

  /// ney.... better  organize in db ...map->provider
  final List<WeatherMeasurement> windSpeed;
  final List<WeatherMeasurement> windGusts;
  final List<WeatherMeasurement> windDirection;

  @override
  State<WindGraph> createState() => _WindGraphState();
}

class _WindGraphState extends State<WindGraph> with ChartMixin {
  late List<Color> gradientColors = WindData.colors(maxY);

  List<FlSpot> windSpeedSpots = [];
  List<FlSpot> windGustsSpots = [];

  double get maxY => double.parse(maxGusts.value) + 2;

  late WeatherMeasurement maxWindSpeed = widget.windSpeed.first;
  late WeatherMeasurement maxGusts = widget.windGusts.first;
  late WeatherMeasurement maxWindDirection = widget.windDirection.first; // :-x

  void calculateSpots() {
    for (int i = 0; i < widget.windSpeed.length; i++) {
      final speed = widget.windSpeed[i];
      final double value = double.tryParse(speed.value) ?? 0;
      windSpeedSpots.add(FlSpot(speed.time.hour.toDouble(), value.toDouble()));

      if (double.parse(maxWindSpeed.value) < value) maxWindSpeed = speed;

      final gusts = widget.windGusts[i];
      final gustsSpeed = double.parse(gusts.value);
      windGustsSpots.add(FlSpot(gusts.time.hour.toDouble(), gustsSpeed));

      if (double.parse(maxGusts.value) < gustsSpeed) {
        maxGusts = widget.windGusts[i];
      }
    }
  }

  @override
  void initState() {
    super.initState();
    assert(widget.windDirection.length == 24);
    assert(widget.windSpeed.length == 24);
    assert(widget.windGusts.length == 24);
    calculateSpots();
    onChartHover(null);
  }

  String timeLabel = "hh:mm a";
  String windLabel = "12";
  String windLabelSmall = "km . gusts 12 on x direction";

  void onChartHover(int? hoveredHour) {
    late WeatherMeasurement speed, gusts, direction;

    if (hoveredHour == null) {
      speed = maxWindSpeed;
      gusts = maxGusts;
      timeLabel = "Maximum wind speed";
      // ...
    } else {
      speed = widget.windSpeed.elementAt(hoveredHour);
      timeLabel = DateFormat("h:mm a").format(speed.time);
      gusts = widget.windGusts.elementAt(hoveredHour);
    }

    windLabel = UserFormatter.wind(
      double.parse(speed.value),
    ); //TODO: format unit
    windLabelSmall = "${speed.unit} - ${gusts.value}${gusts.unit} gusts";

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
          value: windLabel,
          trailingValue: windLabelSmall,
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
                bottomTitleWidgets(value, meta, data: widget.windSpeed),
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
          spots: windGustsSpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors.map((e) => e.withValues(alpha: 1)).toList(),
            begin: .bottomCenter,
            end: .topCenter,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
        LineChartBarData(
          spots: windSpeedSpots,
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
