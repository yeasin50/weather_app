import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

mixin _AxisPainter {
  /// paint dotted axis's , part of [drawPaintAxis]
  void drawDottedPath(
    Canvas canvas,
    Path path,
    Paint paint, {
    double gap = 10,
    double tangentVM = 4,
  }) {
    assert(gap > 0);
    for (final metric in path.computeMetrics()) {
      for (double distance = 0; distance < metric.length; distance += gap) {
        final tangent = metric.getTangentForOffset(distance);

        if (tangent != null) {
          canvas.drawLine(
            tangent.position,
            tangent.position + tangent.vector * tangentVM,
            paint,
          );
        }
      }
    }
  }

  /// draw axis + fill Section and returns Offset of current hour progress
  /// if returns null, don't show anything
  /// on [debug] will show a ball at active hour
  Offset? drawPaintAxis(
    Canvas canvas,
    Size size,
    Color color,
    double progress, [
    bool debug = false,
  ]) {
    final center = Offset(size.width / 2, size.height * 1.25);
    final radius = size.width / 2;
    // final radius = min(size.width / 2, size.height);
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
      ..color = color.withAlpha(150);

    drawDottedPath(canvas, path, paint);

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

    if (progress <= 0) return null;

    /// moving sun/moon //TODO: replace
    final x = size.width * progress;
    final dx = x - center.dx;
    final y = center.dy - sqrt(radius * radius - dx * dx);

    final starPosition = Offset(x, y);

    //TODO: rotate sun
    if (debug) canvas.drawCircle(starPosition, 5, Paint()..color = color);
    return starPosition;
  }
}

class MoonPainter extends CustomPainter with _AxisPainter {
  const MoonPainter(
    this.animation, {
    this.moonFraction = .5,
    this.color = Colors.red,
  }) : super(repaint: animation);

  /// from  rise to set progress
  final Animation animation;

  final Color color;

  /// how much  should be fill 0-1
  final double moonFraction;

  @override
  void paint(Canvas canvas, Size size) {
    assert(moonFraction >= 0 && moonFraction <= 1);
    final moonOffset = drawPaintAxis(canvas, size, color, animation.value);
    if (moonOffset == null) return;

    final moonRadius = size.width * .05;

    final p1 = Path()
      ..addOval(Rect.fromCircle(center: moonOffset, radius: moonRadius));

    final shiftX = lerpDouble(moonRadius * 2, moonRadius * .3, moonFraction)!;
    final shiftY = lerpDouble(0, -0, moonFraction)!;
    final p2 = Path()
      ..addOval(
        Rect.fromCircle(
          center: moonOffset.translate(shiftX, shiftY),
          radius: moonRadius,
        ),
      );

    final path = Path.combine(PathOperation.difference, p1, p2);

    canvas.save();
    canvas.translate(moonOffset.dx, moonOffset.dy);
    //TODO: the set angle after .85 should I change for ux or keep real ?...
    canvas.rotate(lerpDouble(-75, 45, animation.value)! * pi / 180);
    canvas.translate(-moonOffset.dx, -moonOffset.dy);
    canvas.drawPath(path, Paint()..color = color);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant MoonPainter oldDelegate) {
    return moonFraction != oldDelegate.moonFraction;
  }
}

class StarTrajectoryPainer extends CustomPainter with _AxisPainter {
  const StarTrajectoryPainer(this.animation, {this.color = Colors.red})
    : super(repaint: animation);

  final Animation animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    drawPaintAxis(canvas, size, color, animation.value);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
