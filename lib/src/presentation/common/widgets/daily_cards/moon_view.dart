import 'package:flutter/material.dart';
import '/src/presentation/common/common.dart';
import '../../../../domain/entity/weather_record.dart';
import 'daily_card_wrapper.dart';

class MoonView extends StatelessWidget {
  const MoonView({
    super.key,
    required this.todayRise,
    required this.todayDown,
    required this.progress,
    this.phase,
  });

  final DateTime todayRise;
  final DateTime todayDown;
  final double progress;
  final WeatherMeasurement? phase;

  @override
  Widget build(BuildContext context) {
    return DailyItemCard(
      onTap: () {},
      child: Column(
        spacing: 8,
        children: [
          Row(spacing: 6, children: [Icon(Icons.star), Text("moon")]),
          Expanded(
            child: CustomPaint(
              painter: StarTrajectoryPainer(
                AlwaysStoppedAnimation(progress),
                color: Colors.blueGrey,
              ),
              child: Placeholder(color: Colors.grey.withAlpha(14)),
            ),
          ), // paintu....
          Row(
            children: [
              Text(todayRise.formatHMa ),
              Spacer(),
              Text(todayDown.formatHMa ),
            ],
          ),
          Text("phase view..."),
        ],
      ),
    );
  }
}
