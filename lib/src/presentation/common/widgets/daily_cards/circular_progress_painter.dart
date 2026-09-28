import 'package:flutter/material.dart';

import 'dart:math' as math;

class CircularProgressPainter extends CustomPainter {
  const CircularProgressPainter(
    this.progress, [
    this.color = Colors.amberAccent,
  ]) : super(repaint: progress);

  final Animation progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = .stroke
      ..strokeCap = .round
      ..strokeWidth = 7;

    canvas.drawPath(
      Path()..addArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        -math.pi * 1.25,
        math.pi * 1.5,
      ),
      paint..color = color.withAlpha(50),
    );

    final path = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        -math.pi * 1.25,
        math.pi * 1.5 * progress.value,
      );

    canvas.drawPath(path, paint..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
