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
              // const MessurementView(),

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

/// ...
