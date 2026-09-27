import 'dart:math';

import 'package:flutter/material.dart';
import '/src/presentation/common/weather_value_formatter.dart';
import '../../../../domain/entity/weather_record.dart';

class HumadityView extends StatelessWidget {
  const HumadityView({super.key, required this.measurement});
  final WeatherMeasurement measurement;

  @override
  Widget build(BuildContext context) {
    final int? percentage = int.tryParse(measurement.value.toString());
    assert(percentage != null);

    final style = TextTheme.of(context);
    final scheme = Theme.of(context).colorScheme;

    final shapeBorder = RoundedRectangleBorder(borderRadius: .circular(24));

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Positioned.fill(
            child: Material(
              clipBehavior: .hardEdge,
              color: scheme.surfaceContainer,
              shape: shapeBorder,
              child: CustomPaint(painter: _HumidityPainter()),
            ),
          ),

          Positioned.fill(
            child: Material(
              // this is required because I want splash over CustomPaint
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                customBorder: shapeBorder,
                splashColor: Colors.greenAccent.withAlpha(100),
              ),
            ),
          ),

          Positioned.fill(
            top: 32,
            bottom: 32,
            left: 12,
            child: Column(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .stretch,
              children: [
                Row(
                  children: [Icon(Icons.water_drop_outlined), Text("humidity")],
                ),
                Text(measurement.formatValue, style: style.displayLarge),
                Row(spacing: 8, children: [CircleAvatar(), Text("Dew point")]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HumidityPainter extends CustomPainter {
  const _HumidityPainter({
    super.repaint,
    this.amplitude = 8,
    this.frequency = .12,
    this.height = .75,
    this.shift = 2.88,
  });

  /// range 0-1
  final double height;

  final double amplitude;
  final double frequency;

  final double shift;

  @override
  void paint(Canvas canvas, Size size) {
    assert(height > 0 && height < 1);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    final path = Path();

    Offset? startPoint;
    for (double x = 0; x <= size.width; x++) {
      double y =
          size.height * (1 - height) + amplitude * sin(x * frequency + shift);
      if (x == 0) {
        path.moveTo(x, y);
        startPoint = Offset(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(startPoint!.dx, startPoint.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
