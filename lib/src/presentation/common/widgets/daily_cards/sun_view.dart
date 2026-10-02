import 'package:flutter/material.dart';
import '/src/presentation/common/common.dart';
import 'daily_card_wrapper.dart';

class SunView extends StatefulWidget {
  const SunView({
    super.key,
    this.isSun = true,
    required this.rise,
    required this.down,
    this.phase = "",
    required this.progress,
    this.moonfraction,
  });

  final bool isSun;
  final DateTime rise;
  final DateTime down;
  final double progress;
  final String phase;

  /// only used for moon, act a knife how much moon should be visible 0-1
  final double? moonfraction;

  @override
  State<SunView> createState() => _SunViewState();
}

class _SunViewState extends State<SunView> with SingleTickerProviderStateMixin {
  DateTime get rise => widget.rise;
  DateTime get fall => widget.down;

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: Durations.long4,
  );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 1));
      // TODO: not static 2 sec,consider progress
      controller.animateTo(widget.progress, duration: Duration(seconds: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);
    final timeStyle = style.bodyMedium?.copyWith(fontWeight: .w600);

    return DailyItemCard(
      onTap: () {},
      child: Column(
        spacing: 8,
        children: [
          Row(
            spacing: 6,
            children: [Icon(Icons.star), Text(widget.isSun ? "sun" : "moon")],
          ),
          Expanded(
            child: CustomPaint(
              painter: widget.isSun
                  ? StarTrajectoryPainer(controller, color: Colors.amberAccent)
                  : MoonPainter(
                      controller,
                      color: Colors.blueGrey,
                      moonFraction: widget.moonfraction ?? 1,
                    ),
              child: SizedBox.expand(),
            ),
          ),
          Row(
            children: [
              Text(widget.rise.formatHMa, style: timeStyle),
              Spacer(),
              Text(widget.down.formatHMa, style: timeStyle),
            ],
          ),
          Text(widget.phase),
        ],
      ),
    );
  }
}
