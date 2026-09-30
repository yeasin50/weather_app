import 'dart:math';

import 'package:flutter/material.dart';

class StarTrajectoryPainer extends CustomPainter {
  const StarTrajectoryPainer(this.animation, {this.color = Colors.red})
    : super(repaint: animation);

  final Animation animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 1.1);
    final radius = size.width / 2;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final path = Path.combine(
      PathOperation.intersect, // cam  reduce with center.height
      Path()
        ..addOval(Rect.fromCircle(center: center, radius: radius))
        ..moveTo(0, size.height)
        ..lineTo(size.width, size.height)
        ..close(),
      Path()..addRect(rect),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin
      ..strokeWidth = 1
      ..color = color.withAlpha(200);

    drawDottedPath(canvas, path, paint);

    final progress = animation.value;
    // fill section
    final fillPath = Path.combine(
      .intersect,
      path,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width * progress, size.height)),
    );

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          colors: [color.withAlpha(100), color.withAlpha(0)],
          begin: .topCenter,
          end: .bottomCenter,
        ).createShader(rect),
    );

    /// moving sun/moon
    final x = size.width * progress;
    final dx = x - center.dx;
    final y = center.dy - sqrt(radius * radius - dx * dx);

    //TODO: rotate sun
    canvas.drawCircle(Offset(x, y), 5, Paint()..color = color);
  }

  void drawDottedPath(
    Canvas canvas,
    Path path,
    Paint paint, {
    double gap = 20,
  }) {
    assert(gap > 0);
    for (final metric in path.computeMetrics()) {
      for (double distance = 0; distance < metric.length; distance += gap) {
        final tangent = metric.getTangentForOffset(distance);

        if (tangent != null) {
          canvas.drawLine(
            tangent.position,
            tangent.position + tangent.vector * 10,
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
