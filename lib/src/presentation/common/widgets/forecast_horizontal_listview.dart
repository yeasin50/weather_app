import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../infrastructure/infrastructure.dart';
import 'forecast_list_tile.dart';

class ForecastHorizontalListview extends StatefulWidget {
  const ForecastHorizontalListview({
    super.key,
    required this.data,
    required this.isHourly,
  });

  const ForecastHorizontalListview.hourly({
    super.key,
    required this.data,
  }) : isHourly = true;

  const ForecastHorizontalListview.weekly({
    super.key,
    required this.data,
  }) : isHourly = false;

  /// handle hour/weekly preview
  final bool isHourly;
  final List<HourlyWeatherInfo> data;

  @override
  State<ForecastHorizontalListview> createState() => _ForecastHorizontalListviewState();
}

class _ForecastHorizontalListviewState extends State<ForecastHorizontalListview> {
  String label(int i) => widget.isHourly ? "${widget.data[i].date.hour}" : DateFormat("E").format(widget.data[i].date);

  List<GlobalKey> tileKeys = [];
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    tileKeys = List.generate(widget.data.length, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = 0;
      final today = DateTime.now();
      if (widget.isHourly) {
        index = today.hour;
      } else {
        index = widget.data.indexWhere(
          (element) => element.date.day == today.day,
        );
      }
      moveToIndex(index);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void moveToIndex(int i) {
    final ctx = tileKeys[i].currentContext;
    if (ctx == null) return;
    final target = ctx.findRenderObject() as RenderBox;

    final position = target.localToGlobal(Offset.zero, ancestor: context.findRenderObject());

    controller.animateTo(position.dx, duration: Durations.long4, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < widget.data.length; i++)
              ForecastListTile(
                key: tileKeys.elementAt(i),
                label: label(i),
                info: widget.data.elementAt(i),
              ),
          ],
        ),
      ),
    );
  }
}
