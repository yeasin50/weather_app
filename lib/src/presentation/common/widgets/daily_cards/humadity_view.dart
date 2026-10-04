import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../models/models.dart';

class HumadityView extends StatefulWidget {
  const HumadityView({super.key, required this.data, this.onTap});

  final HumidityDuePointData data;
  final VoidCallback? onTap;

  @override
  State<HumadityView> createState() => _HumadityViewState();
}

class _HumadityViewState extends State<HumadityView>
    with SingleTickerProviderStateMixin {
  late final humadityController = AnimationController(
    vsync: this,
    duration: Durations.medium3,
    upperBound: 100,
  );

  int get humadity => humadityController.value.toInt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      humadityController.animateTo(
        widget.data.humidity.toDouble(),
        duration: Duration(seconds: 4),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void dispose() {
    humadityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.data.humidity >= 0 && widget.data.humidity <= 100);

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
                  humadity: humadityController.view,
                  color: widget.data.humidityColor, // update color?
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Material(
              // this is required because I want splash over CustomPaint
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                customBorder: shapeBorder,
                splashColor: Colors.greenAccent.withAlpha(100),
              ),
            ),
          ),

          Positioned.fill(
            top: 16, //TODO: align  after font selection
            bottom: 16,
            left: 12,
            child: ValueListenableBuilder(
              valueListenable: humadityController,
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.water_drop_outlined),
                        Text("humidity"),
                      ],
                    ),
                    Text("$humadity%", style: style.displayMedium),
                    Row(
                      spacing: 8,
                      children: [
                        Material(
                          color: widget.data.dewPointColor,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.data.dewPoint.toString()}\u00B0",
                              textAlign: .center,
                              style: style.bodyMedium?.copyWith(
                                fontWeight: .w600,
                              ),
                            ), //FIXME: move to specific place
                          ),
                        ),
                        Text("Dew point"),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          // Slider(
          //   value: value,
          //   max: 100,
          //   onChanged: (v) {
          //     value = v;
          //     setState(() {});
          //   },
          // ),
        ],
      ),
    );
  }
}

class _HumidityPainter extends CustomPainter {
  const _HumidityPainter({
    required this.humadity,
    this.frequency = .12,
    this.shift = 2.88,
    required this.color,
  }) : super(repaint: humadity);

  /// range 0-1
  final Animation humadity;

  final double frequency;

  final double shift;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final height = humadity.value / 100;
    assert(height >= 0 && height <= 1);

    //wonder if I should reverse it
    final double amplitude = lerpDouble(8, 3, height)!;

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
