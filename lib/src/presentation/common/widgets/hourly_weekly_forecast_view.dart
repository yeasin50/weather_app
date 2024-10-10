import 'dart:ui';

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

    return _BGFilter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
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
                const SizedBox(width: 24),
                Expanded(
                  child: TextButton(
                    style: activeTabStyle.copyWith(
                        side: isHourlyForecastTab ? WidgetStateProperty.all(BorderSide.none) : null,
                        shape: WidgetStatePropertyAll(StarBorder())),
                    onPressed: () {
                      isHourlyForecastTab = false;
                      setState(() {});
                    },
                    child: const Text("Weekly Forecast"),
                  ),
                ),
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}

class _BGFilter extends StatelessWidget {
  const _BGFilter({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 84,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
