import 'dart:math' show sqrt;

import 'package:flutter/material.dart';
import '/src/presentation/common/common.dart';
import '../../../../domain/entity/weather_record.dart';
import 'daily_card_wrapper.dart';

class MoonView extends StatefulWidget {
  const MoonView({
    super.key,
    this.previousRise,
    this.todayRise,
    this.todayDown,
    this.phase,
  });

  final DateTime? previousRise;
  final DateTime? todayRise;
  final DateTime? todayDown;
  final WeatherMeasurement? phase;

  @override
  State<MoonView> createState() => _MoonViewState();
}

class _MoonViewState extends State<MoonView> {
  double value = 0;

  DateTime? rise;
  DateTime? fall;

  @override
  void initState() {
    super.initState();
    caluculateProgress();
  }

  DateTime now = DateTime.now();
  void caluculateProgress() {
    DateTime? start;
    DateTime? end;

    if (widget.previousRise != null &&
        widget.todayDown != null &&
        (widget.todayRise == null || now.isBefore(widget.todayRise!))) {
      start = widget.previousRise;
      end = widget.todayDown;
    }
    if (widget.todayRise != null &&
        widget.todayDown != null &&
        now.isAfter(widget.todayRise!) &&
        now.isBefore(widget.todayDown!)) {
      start = widget.todayRise;
      end = widget.todayDown;
    }

    // moon has set
    if (widget.todayDown != null && now.isAfter(widget.todayDown!)) {
      value = 1;
    }

    if (start != null && end != null) {
      final total = end.difference(start).inSeconds;
      final elapsed = now.difference(start).inSeconds;

      value = (elapsed / total).clamp(0.0, 1.0);
    }

    print("Moon now:$now start:$start end:$end value:$value");
  }

  double progress = 0;
  @override
  Widget build(BuildContext context) {
    final String label = "Moon";

    return Column(
      children: [
        Slider(
          value: value,
          min: 0,
          max: 1,
          onChanged: (v) {
            value = v;
            setState(() {});
          },
        ),
        Expanded(
          child: DailyItemCard(
            onTap: () {},
            child: Column(
              spacing: 8,
              children: [
                Row(spacing: 6, children: [Icon(Icons.star), Text(label)]),
                Expanded(
                  child: CustomPaint(
                    painter: _StarTrajectoryPainer(
                      AlwaysStoppedAnimation(value),
                      color: Colors.blueGrey,
                    ),
                    child: Placeholder(color: Colors.grey.withAlpha(14)),
                  ),
                ), // paintu....
                Row(
                  children: [
                    Text(rise?.formatHMa ?? ""),
                    Spacer(),
                    Text(fall?.formatHMa ?? ""),
                  ],
                ),
                Text("phase view..."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StarTrajectoryPainer extends CustomPainter {
  const _StarTrajectoryPainer(this.animation, {this.color = Colors.red})
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
