import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
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
              if (widget.data.first is HourlyForecast) HourlyForecastListView(),
              if (widget.data.first is DailyForecast)
                ...widget.data.map((e) {
                  return ForecastListTile(info: e);
                }),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForecastListView extends StatelessWidget {
  const HourlyForecastListView({super.key, this.padding});

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final schema = Theme.of(context).colorScheme;
    return Consumer<CityWeatherNotifier>(
      builder: (context, value, child) {
        final data = value.todaysHourlyForecast;
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Material(
            color: schema.surfaceContainerLow,
            shape: RoundedRectangleBorder(borderRadius: .circular(9)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                scrollDirection: .horizontal,
                padding: padding,
                child: Row(
                  spacing: 12,
                  children: data.mapIndexed((i, e) {
                    final color = e.isSelected
                        ? schema.surfaceContainerHigh
                        : Colors.transparent;

                    return GestureDetector(
                      onTap: () {
                        ///nav to day  view
                      },
                      child: ForecastListTile(isActive: e.isSelected, info: e),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
