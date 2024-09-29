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

  void moveToIndex() {
    final time = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < widget.data.length; i++)
              ForecastListTile(
                label: label(i),
                info: widget.data.elementAt(i),
              ),
          ],
        ),
      ),
    );
  }
}
