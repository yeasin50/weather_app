import 'package:flutter/material.dart';

import '../../widgets/weather_card_view.dart';
import 'hourly_forecast_tile.dart';

class HomeWeatherBottomSheet extends StatelessWidget {
  const HomeWeatherBottomSheet({super.key});

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

    return DecoratedBox(
      decoration: const BoxDecoration(
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
      ),
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
                          for (int i = -1; i < 6; i++)
                            const ForecastRowTile(
                              label: "12",
                              mood: WeatherMood.midRain,
                              temp: 12,
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
                          for (int i = -1; i < 6; i++)
                            const ForecastRowTile(
                              label: "Sun",
                              mood: WeatherMood.midRain,
                              temp: 12,
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
