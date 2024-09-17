import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class TodaysForecastView extends StatelessWidget {
  const TodaysForecastView({
    super.key,
    required this.dayForecast,
  });

  final MetroApiResponse dayForecast;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
