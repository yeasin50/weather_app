import 'dart:math';

import 'package:flutter/material.dart';
import '/src/presentation/common/weather_value_formatter.dart';

import '../../../../domain/entity/weather_record.dart';
import 'daily_card_wrapper.dart' show DailyItemCard;

@Deprecated("USE DailyWeatherCard instead")
class UvindexView extends StatelessWidget {
  const UvindexView({super.key, required this.uvIndex});

  final WeatherMeasurement uvIndex;

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);

    return DailyItemCard(
      //FIXME: MaterialShape on InkWell have some corner issue on Splash
      border: UVIndexShape(2),
      onTap: () {},
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisSize: .min,
            spacing: 8,
            children: [
              Icon(Icons.sunny),
              Text("UV Index", style: style.bodyLarge),
            ],
          ),
          Text(uvIndex.value, style: style.displayLarge),
          Text(uvIndex.formatValue),
          SizedBox(),
        ],
      ),
    );
  }
}

class UVIndexShape extends ShapeBorder {
  const UVIndexShape(this.colorIndex);
  final int colorIndex;
  @override
  EdgeInsetsGeometry get dimensions => .zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    final cx = rect.size.width / 2;
    final cy = rect.size.height / 2;

    final baseRadius = rect.width / 2;
    final waveHeight = baseRadius * .05;
    final int waves = 12;

    final startAngle = -360 / waves - 2 * pi / 180;
    for (int i = 0; i <= 360; i++) {
      double angle = i * pi / 180;

      double radius = baseRadius + sin(startAngle + angle * waves) * waveHeight;

      double x = cx + cos(angle) * radius;
      double y = cy + sin(angle) * radius;

      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final colors = [
      Colors.greenAccent,
      Colors.yellowAccent,
      Colors.amberAccent,
      Colors.redAccent,
      Colors.deepPurpleAccent,
    ].reversed.toList();

    double stepAngle = 30 * pi / 180;
    double startAngle = 30 * pi / 180;
    final radius = rect.width / 2 * .85;

    for (int i = 0; i < 5; i++) {
      final x = rect.center.dx + cos(startAngle + i * stepAngle) * radius;
      final y = rect.center.dy + sin(startAngle + i * stepAngle) * radius;

      canvas.drawCircle(
        Offset(x, y),
        15,
        Paint()
          ..color = colors[i].withAlpha(i == colorIndex ? 255 : 100)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  ShapeBorder scale(double t) => this;
}
