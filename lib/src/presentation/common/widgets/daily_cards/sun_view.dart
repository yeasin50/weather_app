import 'package:flutter/material.dart';
import '/src/presentation/common/common.dart';
import '../../../../domain/entity/weather_record.dart';
import 'daily_card_wrapper.dart';

class SunView extends StatefulWidget {
  const SunView({
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
  State<SunView> createState() => _SunViewState();
}

class _SunViewState extends State<SunView> {
  double value = 0;

  DateTime get rise => widget.rise;
  DateTime get fall => widget.down;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    if (now.isBefore(rise)) {
      value = 0;
    } else if (now.isAfter(fall)) {
      value = 1;
    } else {
      final duration = fall.difference(rise);
      final currentSpan = now.difference(rise);
      value = currentSpan.inMinutes / duration.inMinutes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider(
        //   value: value,
        //   onChanged: (v) {
        //     value = v;
        //     setState(() {});
        //   },
        // ),
        Expanded(
          child: DailyItemCard(
            onTap: () {},
            child: Column(
              spacing: 8,
              children: [
                Row(spacing: 6, children: [Icon(Icons.star), Text("sun")]),
                Expanded(
                  child: CustomPaint(
                    painter: StarTrajectoryPainer(
                      AlwaysStoppedAnimation(value),
                      color: widget.isSun
                          ? Colors.amberAccent
                          : Colors.blueGrey,
                    ),
                    child: Placeholder(color: Colors.grey.withAlpha(14)),
                  ),
                ), // paintu....
                Row(
                  children: [
                    Text(widget.rise.formatHMa),
                    Spacer(),
                    Text(widget.down.formatHMa),
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
