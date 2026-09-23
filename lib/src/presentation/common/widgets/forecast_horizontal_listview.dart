import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../../provider/providers.dart';

import 'forecast_list_tile.dart';

class ForecastHorizontalListview<T extends ForecastData>
    extends StatefulWidget {
  const ForecastHorizontalListview({
    super.key,
    required this.data,
    this.padding,
  });

  ///  [DailyForecast] or [HourlyForecast]
  final List<T> data;

  final EdgeInsets? padding;

  @override
  State<ForecastHorizontalListview<ForecastData>> createState() =>
      _ForecastHorizontalListviewState<ForecastData>();
}

class _ForecastHorizontalListviewState<T extends ForecastData>
    extends State<ForecastHorizontalListview<T>> {
  @override
  Widget build(BuildContext context) {
    assert(
      widget.data.first is HourlyForecast || widget.data.first is DailyForecast,
      'Expected HourlyForecast or DailyForecast but got ${widget.data.first.runtimeType}',
    );

    final schema = Theme.of(context).colorScheme;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Material(
        color: schema.surfaceContainerLow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 16,
            children: [
              if (widget.data.first is DailyForecast)
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.calendar_month),
                    Text("Daily forecast"),
                  ],
                ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: widget.padding,
                child: Row(
                  spacing: 12,
                  children: widget.data
                      .mapIndexed(
                        (i, e) => GestureDetector(
                          onTap: () {},
                          child: ForecastListTile(
                            isActive: e.isSelected,
                            info: e,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
