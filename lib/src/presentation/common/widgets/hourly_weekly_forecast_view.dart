import 'package:flutter/material.dart';

import '../../../infrastructure/infrastructure.dart';
import 'forecast_horizontal_listview.dart';

class HourWeeklyForecastView extends StatefulWidget {
  const HourWeeklyForecastView({
    super.key,
    required this.hourlyForecast,
    required this.weeklyForecast,
  });

  final List<HourlyWeatherInfo> hourlyForecast;
  final List<HourlyWeatherInfo> weeklyForecast;

  @override
  State<HourWeeklyForecastView> createState() => _HourWeeklyForecastViewState();
}

class _HourWeeklyForecastViewState extends State<HourWeeklyForecastView> {
  bool isHourlyForecastTab = true;

  List<HourlyWeatherInfo> get hourlyForecast => widget.hourlyForecast;

  List<HourlyWeatherInfo> get weeklyForecast => widget.weeklyForecast;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeTabStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black26,
      side: const BorderSide(
        width: 1,
        color: Colors.cyanAccent,
      ),
    );

    const decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(46, 51, 90, .52),
          Color.fromRGBO(28, 27, 51, .52),
        ],
      ),
    );
    return DecoratedBox(
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const FractionallySizedBox(
              widthFactor: .25,
              child: Divider(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: activeTabStyle.copyWith(
                      side: isHourlyForecastTab ? activeTabStyle.side : WidgetStateProperty.all(BorderSide.none),
                    ),
                    onPressed: () {
                      isHourlyForecastTab = true;
                      setState(() {});
                    },
                    child: const Text("Hourly Forecast"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextButton(
                    style: activeTabStyle.copyWith(
                      side: isHourlyForecastTab ? WidgetStateProperty.all(BorderSide.none) : null,
                    ),
                    onPressed: () {
                      isHourlyForecastTab = false;
                      setState(() {});
                    },
                    child: const Text("Weekly Forecast"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            IndexedStack(
              index: isHourlyForecastTab ? 0 : 1,
              children: [
                ForecastHorizontalListview.hourly(
                  data: hourlyForecast,
                ),
                ForecastHorizontalListview.weekly(
                  data: weeklyForecast,
                ),
              ],
            ),
            const SizedBox(height: 150)
          ],
        ),
      ),
    );
  }
}
