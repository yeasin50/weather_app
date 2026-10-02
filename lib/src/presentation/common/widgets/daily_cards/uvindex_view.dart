import 'dart:math';

import 'package:flutter/material.dart';

class UVIndexShape extends ShapeBorder {
  const UVIndexShape(this.colorIndex, {this.colors = const []});
  final int colorIndex;
  final List<Color> colors;
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

    final baseRadius = rect.width / 2 - 8;
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
    assert(colors.length == 5, "require 5 UV colors");

    double stepAngle = -30 * pi / 180;
    double startAngle = -pi + stepAngle;
    final radius = rect.width / 2 * .85;

    // dart format off
    final dotRadius = rect.width * .045;
    for (int i = 0; i < 5; i++) {
      final activeIndex = i == colorIndex;
      final dotFlexRadius = activeIndex ? radius * .95 : radius;
      final x = rect.center.dx + cos(startAngle + i * stepAngle) * dotFlexRadius;
      final y = rect.center.dy + sin(startAngle + i * stepAngle) * dotFlexRadius;

      canvas.drawCircle(
        Offset(x, y),
        activeIndex ? dotRadius : dotRadius * .7,
        Paint()
          ..color = colors[i].withAlpha(i == colorIndex ? 255 : 100)
          ..style = PaintingStyle.fill,
      );
    }
    // dart format on
  }

  @override
  ShapeBorder scale(double t) => this;
}
