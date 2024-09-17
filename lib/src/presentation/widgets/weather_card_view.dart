import 'package:flutter/material.dart';

enum WeatherMood {
  midRain,
  fastWind,
  showers,
  tornado;
}

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

    return AspectRatio(
      aspectRatio: 342 / 148,
      child: CustomPaint(
        painter: WeatherCardShape(),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    temp.toStringAsFixed(0),
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 24),
                  Text("H:$humidity L:$rain")
                ],
              ),
            ),
            const Expanded(
              child: Column(
                children: [
                  Expanded(child: Placeholder()),
                  Text("midRain"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeatherCardShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //left  5936B4 , right 362A84

    final Path path = Path();

    final double radiusGap = size.height / 10;
    final linearGradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF5936B4),
          Color(0xFF362A84),
        ],
        begin: Alignment(-1, .5),
        end: Alignment(1, .5),
      ).createShader(Rect.largest);

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
