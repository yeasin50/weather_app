import 'package:flutter/material.dart';
import 'dart:math';

///Cheap copy of UVINdex xd
class VisibilityPainter extends CustomPainter {
  VisibilityPainter([this.color = Colors.grey]);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    final path = Path();

    final cx = size.width / 2;
    final cy = size.height / 2;

    final baseRadius = size.width / 2;
    final waveHeight = baseRadius * .03;
    final int waves = 20;

    for (int i = 0; i <= 360; i++) {
      double angle = i * pi / 180;
      double radius = baseRadius + sin(angle * waves) * waveHeight;

      double x = cx + cos(angle) * radius;
      double y = cy + sin(angle) * radius;

      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant VisibilityPainter oldDelegate) => false;
}
