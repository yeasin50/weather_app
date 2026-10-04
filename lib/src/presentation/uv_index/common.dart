import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:math' as math;

import '../../domain/entity/weather_record.dart';

mixin ChartMixin {
  double yInterval(double maxY) {
    final raw = maxY / 5;
    final magnitude = math
        .pow(10, (math.log(raw) / math.ln10).floor())
        .toDouble();
    return (raw / magnitude).ceil() * magnitude;
  }

  Widget bottomTitleWidgets(
    double value,
    TitleMeta meta, {
    required List<WeatherMeasurement> data,
  }) {
    const style = TextStyle();
    final date = data.elementAtOrNull(value.toInt())?.time;
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
    if ((value - rounded).abs() > 0.001) {
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(value.toStringAsFixed(0), style: style),
    );
  }

  LineTouchData lineTouchdate(void Function(int?) onChartHover) =>
      LineTouchData(
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

  /// shows before chart a small row,
  /// on hover theses value update by [lineTouchdate]'s callback
  Widget buildValueIndicator({
    Color color = Colors.cyanAccent,
    required String title,
    required String value,
    required String trailingValue,
  }) => _ChartHoverDataIndicator(
    color: color,
    title: title,
    value: value,
    trailingValue: trailingValue,
  );
}

class _ChartHoverDataIndicator extends StatelessWidget {
  const _ChartHoverDataIndicator({
    required this.color,
    required this.title,
    required this.value,
    required this.trailingValue,
  });

  final Color color;
  final String title;
  final String value;
  final String trailingValue;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Row(
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
                    TextSpan(text: value, style: style.titleLarge),
                    WidgetSpan(child: SizedBox(width: 6)),
                    TextSpan(text: trailingValue, style: style.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// used for charts dialog
class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextTheme.of(context).labelMedium),
        Spacer(),
        IconButton(onPressed: onTap, icon: Icon(Icons.open_in_full_outlined)),
      ],
    );
  }
}
