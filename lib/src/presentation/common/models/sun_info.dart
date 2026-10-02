import 'package:flutter/material.dart' show DateUtils;

import '../../provider/providers.dart';
import 'moon_info.dart';

class SunInfo with StarProgress {
  SunInfo({required this.dailyForecastItems, required this.selectedHour}) {
    init();
  }

  final List<DailyForecast> dailyForecastItems;
  final DateTime selectedHour;

  late DateTime _rise;
  late DateTime _fall;
  late double _progress;

  DateTime get rise => _rise;
  DateTime get fall => _fall;
  double get progress => _progress;

  void init() {
    final hourData = dailyForecastItems.firstWhere(
      (e) => DateUtils.isSameDay(e.time, selectedHour),
    );
    final sunrise = DateTime.parse(hourData.sunrise.value);
    final sunset = DateTime.parse(hourData.sunset.value);
    double fallProgress = 0;

    if (selectedHour.isAfter(sunset)) {
      fallProgress = 1;
    } else {
      final duration = sunset.difference(sunrise);
      final currentSpan = selectedHour.difference(sunrise);
      fallProgress = currentSpan.inMinutes / duration.inMinutes;
    }

    _rise = sunrise;
    _fall = sunset;
    _progress = fallProgress;
  }
}
