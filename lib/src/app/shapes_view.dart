import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24.0),
          child: MoonRiseSetSequenceView(),
        ),
      ),
    ),
  );
}

/// ...

class MoonRiseSetSequenceView extends StatefulWidget {
  const MoonRiseSetSequenceView({super.key});

  @override
  State<MoonRiseSetSequenceView> createState() =>
      _MoonRiseSetSequenceViewState();
}

class _MoonRiseSetSequenceViewState extends State<MoonRiseSetSequenceView> {
  final List<DateTime> riseDate = [
    DateTime.parse("2026-09-30T20:12"),
    DateTime.parse("2026-10-01T21:08"),
    DateTime.parse("2026-10-02T22:09"),
    DateTime.parse("2026-10-03T23:14"),
    DateTime.parse("2026-10-05T00:20"),
    DateTime.parse("2026-10-06T01:26"),
  ];

  final List<DateTime> fallDate = [
    DateTime.parse("2026-09-30T09:16"),
    DateTime.parse("2026-10-01T10:23"),
    DateTime.parse("2026-10-02T11:29"),
    DateTime.parse("2026-10-03T12:30"),
    DateTime.parse("2026-10-04T13:26"),
    DateTime.parse("2026-10-05T14:13"),
    DateTime.parse("2026-10-06T14:55"),
  ];

  late final DateTime start = riseDate.first.isBefore(fallDate.first)
      ? riseDate.first
      : fallDate.first;

  late final DateTime end = riseDate.last.isAfter(fallDate.last)
      ? riseDate.last
      : fallDate.last;

  late final double maxValue = end.difference(start).inMinutes.toDouble();

  DateTime currentHour = DateTime.now();

  double get value {
    return currentHour.difference(start).inMinutes.toDouble();
  }

  void onChanged(double v) {
    setState(() {
      currentHour = start.add(Duration(minutes: v.round()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          max: maxValue,
          value: value.clamp(0, maxValue),
          onChanged: onChanged,
        ),
        Expanded(
          child: CustomPaint(
            painter: MoonRiseSetPainter(currentHour, riseDate, fallDate),
            child: SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}

class MoonRiseSetPainter extends CustomPainter {
  MoonRiseSetPainter(this.currentHour, this.riseDate, this.fallDate);

  final List<DateTime> riseDate;
  final List<DateTime> fallDate;
  final DateTime currentHour;

  @override
  void paint(Canvas canvas, Size size) {
    final DateTime start = riseDate.first.isBefore(fallDate.first)
        ? riseDate.first
        : fallDate.first;

    final DateTime end = riseDate.last.isAfter(fallDate.last)
        ? riseDate.last
        : fallDate.last;

    final width = size.width;
    final height = size.height;

    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Start -> End line
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), paint);

    final total = end.difference(start).inMilliseconds;
    for (final d in riseDate) {
      final current = d.difference(start).inMilliseconds;
      final progress = (current / total).clamp(0.0, 1.0);
      final x = width * progress;
      canvas.drawCircle(
        Offset(x, height / 2 - 100),
        5,
        paint..color = Colors.blueAccent,
      );

      final builder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(ui.TextStyle(color: Colors.grey))
        ..addText(DateFormat("dd hh:mm a").format(d));

      final paragraph = builder.build()
        ..layout(const ui.ParagraphConstraints(width: 100));
      canvas.drawParagraph(paragraph, Offset(x, height / 2 - 100 - 20));
    }

    for (final d in fallDate) {
      final current = d.difference(start).inMilliseconds;
      final progress = (current / total).clamp(0.0, 1.0);
      final x = width * progress;
      canvas.drawCircle(
        Offset(x, height / 2 + 100),
        5,
        paint..color = Colors.redAccent,
      );

      final builder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(ui.TextStyle(color: Colors.grey))
        ..addText(DateFormat("dd hh:mm a").format(d));

      final paragraph = builder.build()
        ..layout(const ui.ParagraphConstraints(width: 100));
      canvas.drawParagraph(paragraph, Offset(x, height / 2 + 120));
    }

    // Current time position
    final current = currentHour.difference(start).inMilliseconds;

    final progress = (current / total).clamp(0.0, 1.0);
    final x = width * progress;

    // Current time marker
    final markerPaint = Paint()..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(x, height / 2), 5, markerPaint);
    final builder = ui.ParagraphBuilder(ui.ParagraphStyle())
      ..pushStyle(ui.TextStyle(color: Colors.grey))
      ..addText(DateFormat("dd hh:mm a").format(currentHour));

    final paragraph = builder.build()
      ..layout(const ui.ParagraphConstraints(width: 100));
    canvas.drawParagraph(paragraph, Offset(x, height / 2 - 30));
  }

  @override
  bool shouldRepaint(covariant MoonRiseSetPainter oldDelegate) {
    return oldDelegate.currentHour != currentHour ||
        oldDelegate.riseDate != riseDate ||
        oldDelegate.fallDate != fallDate;
  }
}
