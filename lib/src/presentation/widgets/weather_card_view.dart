import 'package:flutter/material.dart';

import '../../infrastructure/infrastructure.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.temp,
    required this.humidity,
    required this.rain,
    required this.location,
    required this.mode,
  });

  final double temp;
  final int humidity;
  final int rain;
  final String location;

  final WeatherMood mode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    debugPrint("path  ${mode.imagePath}");

    return AspectRatio(
      aspectRatio: 342 / 148,
      child: CustomPaint(
        painter: WeatherCardShape(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${temp.toStringAsFixed(0)}\u00B0",
                      style: textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "H:$humidity\u00B0 L:$rain\u00B0",
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      location,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        mode.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      mode.label,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCardShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    final double radiusGap = size.height / 10;
    final linearGradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF5936B4),
          Color(0xFF362A84),
        ],
        stops: [0, 1],
        begin: Alignment(-1, .5),
        end: Alignment(1, .5),
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    path
      ..moveTo(0, size.height - radiusGap) //bottomLeft
      ..arcToPoint(
        Offset(radiusGap, size.height),
        radius: Radius.circular(radiusGap),
        clockwise: false,
      )
      ..lineTo(size.width - radiusGap, size.height) //bottomRIght
      ..arcToPoint(
        Offset(size.width, size.height - radiusGap),
        radius: Radius.circular(radiusGap),
        clockwise: false,
      )
      ..lineTo(size.width, size.height / 2) //TopRight
      ..arcToPoint(
        Offset(
          size.width - radiusGap,
          (size.height / 2) - radiusGap,
        ),
        radius: Radius.circular(radiusGap),
        clockwise: false,
      )
      ..lineTo(radiusGap, radiusGap) //TopLeft
      ..arcToPoint(
        Offset(0, radiusGap * 2),
        radius: Radius.circular(radiusGap),
        clockwise: false,
      )
      ..lineTo(0, size.height - radiusGap);

    canvas.drawPath(path, linearGradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
