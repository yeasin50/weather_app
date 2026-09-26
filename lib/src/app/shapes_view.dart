import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ShapesView());
}

class ShapesView extends StatefulWidget {
  const ShapesView({super.key});

  @override
  State<ShapesView> createState() => _ShapesViewState();
}

class _ShapesViewState extends State<ShapesView> {
  double a = 0;
  double b = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 24,
            children: [
              Slider(
                value: a,
                min: 0,
                max: 360,
                label: a.toStringAsFixed(2),
                // divisions: 20,
                showValueIndicator: ShowValueIndicator.alwaysVisible,
                onChanged: (v) {
                  a = v;
                  setState(() {});
                },
              ),
              Slider(
                value: b,
                label: b.toStringAsFixed(2),
                showValueIndicator: ShowValueIndicator.alwaysVisible,
                onChanged: (v) {
                  b = v;
                  setState(() {});
                },
              ),
              const MessurementView(),

              ///
              SizedBox.square(
                dimension: 250,
                child: CustomPaint(
                  painter: WindShapePainter(a.toInt()),
                  child: Column(
                    children: [Text("Humadity"), Spacer(), Text("Something")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessurementView extends StatelessWidget {
  const MessurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 240,
      child: Material(
        color: Colors.grey.shade400,
        clipBehavior: Clip.antiAlias,
        shape: UVIndexShape(2),
        child: InkWell(
          onTap: () {},
          customBorder: UVIndexShape(2),
          child: Column(children: []),
        ),
      ),
    );
  }
}

class WindShapePainter extends CustomPainter {
  const WindShapePainter([this.pointyAngle = 45]);

  final int pointyAngle;

  @override
  void paint(Canvas canvas, Size size) {
    assert(pointyAngle >= 0 && pointyAngle <= 360);

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    final moveRadius = 10; //TODO: create shape
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WindShapePainter oldDelegate) {
    return oldDelegate.pointyAngle != pointyAngle;
  }
}

class HumidityPainter extends CustomPainter {
  HumidityPainter({
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

/// ...

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
