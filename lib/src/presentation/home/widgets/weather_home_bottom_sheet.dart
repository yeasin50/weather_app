import 'package:flutter/material.dart';

import '../../../infrastructure/infrastructure.dart';
import 'hourly_forecast_tile.dart';

class HomeWeatherBottomSheet extends StatelessWidget {
  const HomeWeatherBottomSheet({
    super.key,
    required this.hourlyForecast,
    required this.weeklyForecast,
  });

  final List<HourlyWeatherInfo> hourlyForecast;
  final List<HourlyWeatherInfo> weeklyForecast;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * .6),
          const _ForecastView(),
        ],
      ),
    );
  }
}

class _ForecastView extends StatefulWidget {
  const _ForecastView();

  @override
  State<_ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<_ForecastView> {
  bool isHourlyForecastTab = true;

  List<HourlyWeatherInfo> get hourlyForecast =>
      context.findAncestorWidgetOfExactType<HomeWeatherBottomSheet>()?.hourlyForecast ?? [];

  List<HourlyWeatherInfo> get weeklyForecast =>
      context.findAncestorWidgetOfExactType<HomeWeatherBottomSheet>()?.weeklyForecast ?? [];

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
                SizedBox(
                  height: 172,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < hourlyForecast.length; i++)
                            ForecastRowTile(
                              label: "${hourlyForecast[i].date.hour}",
                              info: hourlyForecast.elementAt(i),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 172,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < weeklyForecast.length; i++)
                            ForecastRowTile(
                              label: weeklyForecast.elementAt(i).date.day.toString(),
                              info: weeklyForecast.elementAt(i),
                            ),
                        ],
                      ),
                    ),
                  ),
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
