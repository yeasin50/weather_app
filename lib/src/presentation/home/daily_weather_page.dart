import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

/// it can takes a selected day  and shows full day  each  section(temp, uvIndex....)
class DailyWeatherPage extends StatefulWidget {
  const DailyWeatherPage({super.key, required this.date});

  /// it can accept any date with or without time,
  /// internally handle dateOnly to preview the day data
  final DateTime date;

  @override
  State<DailyWeatherPage> createState() => _DailyWeatherPageState();
}

class _DailyWeatherPageState extends State<DailyWeatherPage> {
  /// ....
  late final days = context.read<CityWeatherNotifier>().data;

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);

    return DefaultTabController(
      length: days.sevenDaysDailyRecord.length,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: days.sevenDaysDailyRecord
                  .map(
                    (e) => Tab(
                      height: 96,
                      child: Align(
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            Text(DateFormat.E().format(e.time)),
                            Text(
                              e.time.day.toString(),
                              style: style.titleMedium,
                            ),
                            Text(DateFormat.m().format(e.time)),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        /// ...
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
