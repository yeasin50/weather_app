import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '/src/presentation/common/common.dart';
import '../common/widgets/charts/sun_moon_rise_set_graph.dart'
    show SunMoonChart;
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

  final graphScrollController = ScrollController();
  final listController = ScrollController();

  bool isListViewScrolling = false;
  void scrollGraph() {
    if (!isListViewScrolling) return;
    if (!listController.hasClients || !graphScrollController.hasClients) return;

    final value = lerpDouble(
      0,
      graphScrollController.position.maxScrollExtent,
      listController.offset / listController.position.maxScrollExtent,
    )!;

    graphScrollController.jumpTo(value);
  }

  bool isGraphViewScrolling = false;
  void scrollList() {
    if (!isGraphViewScrolling) return;
    if (!listController.hasClients || !graphScrollController.hasClients) return;

    final t =
        graphScrollController.offset /
        graphScrollController.position.maxScrollExtent;

    final value = lerpDouble(0, listController.position.maxScrollExtent, t)!;

    listController.jumpTo(value);
  }

  @override
  void initState() {
    super.initState();
    listController.addListener(scrollGraph);
    graphScrollController.addListener(scrollList);
  }

  @override
  void dispose() {
    graphScrollController.dispose();
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CityWeatherNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(),

              SliverToBoxAdapter(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    isGraphViewScrolling =
                        notification is ScrollStartNotification ||
                        notification is ScrollUpdateNotification;
                    return false;
                  },
                  child: SunMoonChart(
                    graphScrollController: graphScrollController,
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverFillRemaining(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    isListViewScrolling =
                        notification is ScrollStartNotification ||
                        notification is ScrollUpdateNotification;
                    return false;
                  },
                  child: ListView(
                    controller: listController,
                    children: [
                      for (final wd in weekDayData)
                        _WeeklyForecastTile(dailyForecast: wd),
                    ],
                  ),
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
      padding: const .symmetric(horizontal: 24, vertical: 16.0),
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

          _buildTile(Icons.sunny, "$sunriseStr   $sunsetStr"),
          //TODO: update icons
          _buildTile(Icons.dark_mode_outlined, "$moonRiseStr  $moonSetStr"),
        ],
      ),
    );
  }
}
