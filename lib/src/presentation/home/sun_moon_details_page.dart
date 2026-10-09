import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../common/widgets/charts/sun_moon_rise_set_graph.dart'
    show SunMoonChart;
import '/src/presentation/common/common.dart';
import '../provider/providers.dart';

class SunMoonDetailsPage extends StatefulWidget {
  const SunMoonDetailsPage({super.key});

  @override
  State<SunMoonDetailsPage> createState() => _SunMoonDetailsPageState();
}

class _SunMoonDetailsPageState extends State<SunMoonDetailsPage>
    with SingleTickerProviderStateMixin {
  ///
  late final weekDayData = context.read<CityWeatherNotifier>().weeklyForecast;
  late final tabs = weekDayData
      .map(
        (e) => Tab(
          height: 56,
          child: Text(
            "${e.time.day}\n${DateFormat.E().format(e.time)}",
            textAlign: .center,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context);

    return Consumer<CityWeatherNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(),

              SliverToBoxAdapter(child: SunMoonChart()),
              SliverFillRemaining(
                child: ListView(
                  // controller: tabController,
                  children: [
                    for (final wd in weekDayData)
                      _WeeklyForecastTile(dailyForecast: wd),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WeeklyForecastTile extends StatelessWidget {
  const _WeeklyForecastTile({required this.dailyForecast});

  final DailyForecast dailyForecast;

  @override
  Widget build(BuildContext context) {
    /// ..
    Widget _buildTile(IconData icon, String text) {
      return Row(spacing: 12, children: [Icon(icon), Text(text)]);
    }

    final formatter = context.read<UserFormatter>();

    final String sunriseStr = formatter.time(dailyForecast.sunrise);
    final String sunsetStr = formatter.time(dailyForecast.sunset);

    final String moonRiseStr = formatter.time(dailyForecast.moonRise);
    final String moonSetStr = formatter.time(dailyForecast.moonSet);

    final date = DateFormat("EEE, dd MMM").format(dailyForecast.time);

    final style = TextTheme.of(context);
    final color = ColorScheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        spacing: 12,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            date,
            style: style.bodyMedium?.copyWith(
              color: color.onPrimaryFixedVariant, //TODO: update
            ),
          ),

          _buildTile(Icons.sunny, "$sunriseStr $sunsetStr"),
          //TODO: update icons
          _buildTile(Icons.dark_mode_outlined, "$moonRiseStr $moonSetStr"),
        ],
      ),
    );
  }
}
