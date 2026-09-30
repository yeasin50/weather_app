import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/models.dart';

class HumadityView extends StatelessWidget {
  const HumadityView({super.key, required this.data});

  final HumidityDuePointData data;

  @override
  Widget build(BuildContext context) {
    assert(data.humidity >= 0 && data.humidity <= 100);

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
              child: CustomPaint(
                painter: _HumidityPainter(
                  height: data.humidity / 100,
                  color: data.humidityColor,
                ),
              ),
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
                Text("${data.humidity}%", style: style.displayLarge),
                Row(
                  spacing: 8,
                  children: [
                    Material(
                      color: data.dewPointColor,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${data.dewPoint.toString()}\u00B0",
                          textAlign: .center,
                        ), //FIXME: move to specific place
                      ),
                    ),
                    Text("Dew point"),
                  ],
                ),
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
    required this.color,
  });

  /// range 0-1
  final double height;

  final double amplitude;
  final double frequency;

  final double shift;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    assert(height > 0 && height < 1);
    final paint = Paint()
      ..color = color
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
