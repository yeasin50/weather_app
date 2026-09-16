import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../provider/providers.dart';

import 'forecast_list_tile.dart';

class ForecastHorizontalListview extends StatelessWidget {
  const ForecastHorizontalListview({
    super.key,
    required this.data,
    required this.isHourly,
    this.padding,
  });

  const ForecastHorizontalListview.hourly({
    super.key,
    required this.data,
    this.padding,
  }) : isHourly = true;

  const ForecastHorizontalListview.weekly({
    super.key,
    required this.data,
    this.padding,
  }) : isHourly = false;

  /// handle hour/weekly preview
  final bool isHourly;

  /// only from Now to next hour
  final List<HourlyForcast> data;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    String label(int i) => isHourly
        ? "${data[i].time.hour}"
        : DateFormat("E").format(data[i].time);

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: padding,
        child: Row(
          children: [
            for (int i = 0; i < data.length; i++)
              ForecastListTile(
                isActive: data.elementAt(i).isSelected,
                label: label(i),
                info: data.elementAt(i),
              ),
          ],
        ),
      ),
    );
  }
}
