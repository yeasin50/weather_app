import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../domain/domain.dart' show WeatherMeasurement;
import '../../common.dart';
import '../../models/models.dart' show TemparatureData;
import 'common.dart';

/// shows a specific daily weather item for a day
/// FOR Wind speed, gusts, direction
class TemperatureGraph extends StatefulWidget {
  const TemperatureGraph({
    super.key,
    required this.tempData,
    required this.feelsLikeData,
  });

  /// ney.... better  organize in db ...map->provider
  final List<WeatherMeasurement> tempData;
  final List<WeatherMeasurement> feelsLikeData;

  @override
  State<TemperatureGraph> createState() => _TemperatureGraphState();
}

class _TemperatureGraphState extends State<TemperatureGraph> with ChartMixin {
  late List<Color> gradientColors = TemparatureData.colors(maxY);

  List<FlSpot> tempSpots = [];
  List<FlSpot> tempFeelsLikeSpots = [];

  double get maxY => double.parse(maxFeelsLikeTemparature.value) + 2;

  late WeatherMeasurement maxTemperature = widget.tempData.first;
  late WeatherMeasurement maxFeelsLikeTemparature = widget.feelsLikeData.first;

  void calculateSpots() {
    assert(widget.tempData.length == widget.feelsLikeData.length);

    for (int i = 0; i < widget.tempData.length; i++) {
      final speed = widget.tempData[i];
      final double value = double.tryParse(speed.value) ?? 0;
      tempSpots.add(FlSpot(speed.time.hour.toDouble(), value.toDouble()));

      if (double.parse(maxTemperature.value) < value) maxTemperature = speed;

      final feelsLikeTemp = widget.feelsLikeData[i];
      final tempFeelLike = double.parse(feelsLikeTemp.value);
      tempFeelsLikeSpots.add(
        FlSpot(feelsLikeTemp.time.hour.toDouble(), tempFeelLike),
      );

      if (double.parse(maxFeelsLikeTemparature.value) < tempFeelLike) {
        maxFeelsLikeTemparature = widget.feelsLikeData[i];
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
  String tempLabel = "12";
  String tempLabelSmall = "C . actual x c";
  Color inidicatorColor = Colors.red;

  late final formatter = context.read<UserFormatter>();

  void onChartHover(int? hoveredHour) {
    late WeatherMeasurement temp, feelsLike;

    if (hoveredHour == null) {
      temp = maxTemperature;
      feelsLike = maxFeelsLikeTemparature;
      timeLabel = "Maximum";
    } else {
      temp = widget.tempData.elementAt(hoveredHour);
      timeLabel = DateFormat("h:mm a").format(temp.time);
      feelsLike = widget.feelsLikeData.elementAt(hoveredHour);
    }

    tempLabel = formatter.temp(feelsLike);
    tempLabelSmall = "actual ${formatter.temp(temp)}${formatter.tempUnit}";
    inidicatorColor = TemparatureData.color(double.parse(temp.value));

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
          value: tempLabel,
          trailingValue: tempLabelSmall,
          color: inidicatorColor,
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
                bottomTitleWidgets(value, meta, data: widget.tempData),
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
          spots: tempFeelsLikeSpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors.map((e) => e.withValues(alpha: 1)).toList(),
            begin: .bottomCenter,
            end: .topCenter,
          ),
          dotData: dotData(),
          barWidth: 1,
          isStrokeCapRound: true,
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
        LineChartBarData(
          spots: tempSpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors.map((e) => e.withValues(alpha: 1)).toList(),
            begin: .bottomCenter,
            end: .topCenter,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: dotData(),
        ),
      ],
    );
  }
}
