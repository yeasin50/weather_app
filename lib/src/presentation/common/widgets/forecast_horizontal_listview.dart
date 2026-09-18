import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../provider/providers.dart';

import 'forecast_list_tile.dart';

class ForecastHorizontalListview<T extends ForecastData>
    extends StatelessWidget {
  const ForecastHorizontalListview({
    super.key,
    required this.data,
    this.padding,
  });

  ///  [DailyForecast] or [HourlyForecast]
  final List<T> data;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    assert(
      data.first is HourlyForecast || data.first is DailyForecast,
      'Expected HourlyForecast or DailyForecast but got ${data.first.runtimeType}',
    );

    String label(DateTime time) =>
        DateFormat(T is HourlyForecast ? "j" : "E").format(time);

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: padding,
        child: Row(
          children: data
              .map(
                (e) => ForecastListTile(
                  isActive: e.isSelected,
                  label: label(e.time),
                  info: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
