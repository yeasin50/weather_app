import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import '../common/common.dart';
import 'city_weather_card_data_provider.dart';
import 'providers.dart';

/// maintain  specific city  record and show specific hour data
/// hold 7 days data
class CityWeatherNotifier extends WeatherDataExtractor with ChangeNotifier {
  CityWeatherNotifier(this._data, this._selectedDay);
  CityWeatherRecord _data;

  DateTime _selectedDay;
  DateTime get selectedDay => _selectedDay;
  DateTime get selectedHour => _selectedDay.tilHour;

  CityRecord get city => _data.city;

  ({HourlyForecast forecast, DailyForecast dayForecast})
  get selectedHourForcast {
    final forecast = _todaysHourlyForecast.firstWhere((e) {
      return e.time.day == selectedHour.day && e.time.hour == selectedHour.hour;
    });

    final dailyData = weeklyForecast.firstWhere(
      (e) => DateUtils.isSameDay(selectedDay, e.time),
    );

    return (forecast: forecast, dayForecast: dailyData);
  }

  List<ForecastData> _mergeSunriseAndSunset(List<HourlyForecast> forecast) {
    assert(_dailyForecast.isNotEmpty);

    final List<ForecastData> items = [
      _dailyForecast.first.toSunrise,
      _dailyForecast.first.toSunset,
      _dailyForecast[1].toSunrise,
      _dailyForecast[1].toSunset, //enough
    ];

    final dailyStuff = items.where((e) {
      return !e.time.isBefore(forecast.first.time) &&
          !e.time.isAfter(forecast.last.time);
    });

    debugPrint(items.map((e) => e.time).toString());
    debugPrint(dailyStuff.map((e) => e.time).toString());

    final combinedResult = [...forecast, ...dailyStuff];
    combinedResult.sort((a, b) => a.time.compareTo(b.time));
    return combinedResult;
  }

  List<HourlyForecast> _todaysHourlyForecast = [];
  UnmodifiableListView<ForecastData> get todaysHourlyForecast {
    return UnmodifiableListView(_mergeSunriseAndSunset(_todaysHourlyForecast));
  }

  List<DailyForecast> _dailyForecast = [];
  UnmodifiableListView<DailyForecast> get weeklyForecast =>
      UnmodifiableListView(_dailyForecast);

  @override
  void updateCity(CityWeatherRecord record) {
    super.updateCity(record);
    _data = record;

    _dailyForecast = super.parseDailyForecast();
    _todaysHourlyForecast = super.parseTodaysHourlyForecast();

    notifyListeners();
  }

  void updateHour(DateTime date) {
    _selectedDay = date;
    notifyListeners();
  }

  ({DateTime? activeRise, DateTime? activeFall, double progress})
  get activeMoonArc {
    final prevDay = selectedDay.subtract(Duration(days: 1));
    final nextDay = selectedDay.add(Duration(days: 1));

    ///! THIS is what I can think so  far, THe risk missing dates two day's in a row
    // TO be safe, I should fetch past 1 days at least
    /// 1. if rise is null we get previous days' rise
    /// 2. if set is null, we get next days' set
    /// 3. if todayRise is after today's moon-set , we use tomorrows moonSet as today's moonset.

    // dart format off

    DateTime? todayRise = DateTime.tryParse(
      _dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, selectedDay))
              ?.moonRise.value ?? "",
    );

    todayRise ??= DateTime.tryParse( // if todayRise is null, get previous day rise
      _dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, prevDay))
              ?.moonRise.value ?? "",
    );

    DateTime? todayFall = DateTime.tryParse(
      _dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, selectedDay))
              ?.moonSet.value ?? "",
    );

    todayFall ??= DateTime.tryParse(
      _dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, nextDay))
              ?.moonSet.value ?? "",
    );

    assert(todayRise != null && todayFall != null); //let's just hope there won't be continuous  null

    if (todayRise!.isAfter(todayFall!)) {
      todayFall = DateTime.tryParse(
        _dailyForecast
                .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, nextDay))
                ?.moonSet.value ?? "");
    }
   // dart format on

    final progress = caluculateProgress(todayRise, todayFall!);
    print("moon  rise:$todayRise set $todayFall progress $progress");
    return (activeRise: todayRise, activeFall: todayFall, progress: progress);
  }

  double caluculateProgress(DateTime start, DateTime end) {
    double value = 0;
    if (end.isAfter(start)) {
      final total = end.difference(start).inSeconds;
      final elapsed = selectedDay.difference(start).inSeconds;
      value = (elapsed / total).clamp(0.0, 1.0);
    } else {
      value = 1.0;
    }

    return value;
  }
}
