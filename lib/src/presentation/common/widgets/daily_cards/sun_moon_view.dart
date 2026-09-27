import 'package:flutter/material.dart';
import '/src/presentation/common/common.dart';
import '../../../../domain/entity/weather_record.dart';
import 'daily_card_wrapper.dart';

class SunMoonView extends StatelessWidget {
  const SunMoonView({
    super.key,
    required this.rise,
    required this.down,
    this.phase,
    this.isSun = true,
  });

  final DateTime rise;
  final DateTime down;
  final WeatherMeasurement? phase;

  ///also  can get from  here instead of bool; or just from rise and down
  final bool isSun;

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);
    final scheme = Theme.of(context).colorScheme;

    final shapeBorder = RoundedRectangleBorder(borderRadius: .circular(24));
    final String label = isSun ? "Sun" : "Moon";

    final border = RoundedRectangleBorder(borderRadius: .circular(24));
    return DailyItemCard(
      onTap: () {},
      child: Column(
        spacing: 8,
        children: [
          Row(spacing: 6, children: [Icon(Icons.star), Text(label)]),
          Expanded(
            child: CustomPaint(
              painter: _StarTrajectoryPainer(AlwaysStoppedAnimation(.5)),
              child: Placeholder(color: Colors.grey.withAlpha(14)),
            ),
          ), // paintu....
          Row(children: [Text(rise.formatHMa), Spacer(), Text(down.formatHMa)]),
          Text("phase view..."),
        ],
      ),
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
    final path = Path.combine(
      PathOperation.intersect,
      Path()
        ..addOval(Rect.fromCircle(center: center, radius: size.width / 2))
        ..moveTo(0, size.height)
        ..lineTo(size.width, size.height)
        ..close(),
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin
      ..strokeWidth = 1
      ..color = color.withAlpha(200);

    drawDottedPath(canvas, path, paint);

    // fill section //TODO:
    // final progress = animation.value;
    // final fillArch = Path()
    //   ..moveTo(0, size.height)
    //   ..arcToPoint(bottomRight, radius: Radius.circular(222))
    //   ..close();
    //
    // final metrics = fillArch.computeMetrics().first;
    // final partialPath = metrics.extractPath(0, metrics.length * progress);
    //
    // drawDottedPath(canvas, partialPath, paint, gap: 1);
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
