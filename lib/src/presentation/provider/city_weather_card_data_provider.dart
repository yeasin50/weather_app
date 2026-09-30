import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show DateUtils;
import '../../domain/domain.dart';
import '../common/common.dart' show DateExtention;
import 'providers.dart';

/// it offers the daily and hourly specific data for a city
/// humidity, uvIndex, perception, sun and moon ->rise+set, wind, air quality, visibility and pressure
abstract class WeatherDataExtractor {
  WeatherDataExtractor();

  late CityWeatherRecord _data;
  void updateCity(CityWeatherRecord record) => _data = record;

  /// if missing returns empty
  WeatherMeasurement? _getItem(
    List<WeatherMeasurement>? items,
    MeasurementType type,
  ) {
    final result = items?.firstWhereOrNull((e) => e.measurementType == type);
    return result;
  }

  List<HourlyForecast> parseTodaysHourlyForecast() {
    final List<HourlyForecast> result = [];

    final now = DateTime.now();

    final groupByHour = groupBy(_data.hourlyItems, (e) => e.time);
    final times = groupByHour.keys.toList();
    times.removeWhere(
      (e) =>
          e.isBefore(now.tilHour) ||
          !e.isBefore(now.tilHour.add(const Duration(days: 1))),
    );

    for (final t in times) {
      final items = groupByHour[t];
      final weatherCode = _getItem(items, .weatherCode);
      final temp = _getItem(items, .temperature);
      final rain = _getItem(items, .rain);
      final humadity = _getItem(items, .relativeHumidity);

      assert(
        [weatherCode, temp, rain, humadity].every((e) => e != null),
        'temp:${temp != null} rain:${rain != null} humadity:${humadity != null}',
      );

      final forecast = HourlyForecast(
        time: t,
        weatherCode: weatherCode!,
        temp: temp!,
        rain: rain!,
        uvIndex: _getItem(items, .uvIndex)!,
        wind: _getItem(items, .windSpeed)!,
        windDirection: _getItem(items, .windDirection)!,
        // airQuality: _getItem(items, .airQuality)!,
        visibility: _getItem(items, .visiblity)!,
        humadity: humadity!,
        dewPoint: _getItem(items, .dewPoint)!,
        precipitationProbability: _getItem(items, .precipitationProbability)!,
      );

      result.add(forecast);
    }

    if (result.isNotEmpty) result[0] = result[0].updateSelected(true);

    return result;
  }

  List<DailyForecast> parseDailyForecast() {
    final List<DailyForecast> result = [];

    final groupByHour = groupBy(_data.dailyItems, (e) => e.time);
    final times = groupByHour.keys.toList();

    for (final t in times) {
      final items = groupByHour[t];
      final tempMax = _getItem(items, .temperatureMax);
      final tempMin = _getItem(items, .temperatureMin);
      final rain = _getItem(items, .precipitationProbability);
      final weatherCode = _getItem(items, .weatherCode);
      final sunrise = _getItem(items, .sunrise);
      final sunset = _getItem(items, .sunset);

      assert(
        [tempMin, tempMax, rain, weatherCode].every((e) => e != null),
        'tempMin:${tempMin != null}  tempMax:${tempMax != null} rain:${rain != null}',
      );

      result.add(
        DailyForecast(
          time: t,
          tempMin: tempMin!,
          tempMax: tempMax!,
          rain: rain!,
          weatherCode: weatherCode!,
          sunrise: sunrise!,
          sunset: sunset!,
          moonPhase: _getItem(items, .moonPhase)!,
          moonRise: _getItem(items, .moonRise) ?? WeatherMeasurement.emptyW,
          moonSet: _getItem(items, .moonSet) ?? WeatherMeasurement.emptyW,
        ),
      );
    }

    return result;
  }

  // moon  data
  /// OH  moon.. The beauty, Why you are getting over my head?
  /// Am I stunted by your beauty, forgot how to think properly?
  /// & yet.. I can't abound you.
  /// Why is this deception, sometimes in the day and sometimes at night?
  /// I asked your neighbor(last-day), she told you were there yesterday..
  /// I took the path of yesterday, and again I miss you today.
  ///
  /// You have no light, yet you carry such pride!
  /// Would you bless this earthling with your sight?
  ({DateTime? activeRise, DateTime? activeFall, double progress})
  parseMoonData({
    required DateTime selectedDay,
    required List<DailyForecast> dailyForecast,
  }) {
    final prevDay = selectedDay.subtract(Duration(days: 1));
    final nextDay = selectedDay.add(Duration(days: 1));

    ///! THIS is what I can think so  far, THe risk missing dates two day's in a row
    // TO be safe, I should fetch past 1 days at least
    /// 1. if rise is null we get previous days' rise
    /// 2. if set is null, we get next days' set
    /// 3. if todayRise is after today's moon-set , we use tomorrows moonSet as today's moonset.

    // dart format off

    DateTime? todayRise = DateTime.tryParse(
      dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, selectedDay))
              ?.moonRise.value ?? "",
    );

    todayRise ??= DateTime.tryParse( // if todayRise is null, get previous day rise
      dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, prevDay))
              ?.moonRise.value ?? "",
    );

    DateTime? todayFall = DateTime.tryParse(
      dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, selectedDay))
              ?.moonSet.value ?? "",
    );

    todayFall ??= DateTime.tryParse(
      dailyForecast
              .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, nextDay))
              ?.moonSet.value ?? "",
    );

    assert(todayRise != null && todayFall != null); //let's just hope there won't be continuous  null

    if (todayRise!.isAfter(todayFall!)) {
      todayFall = DateTime.tryParse(
        dailyForecast
                .firstWhereOrNull((e) => DateUtils.isSameDay(e.time, nextDay))
                ?.moonSet.value ?? "");
    }
   // dart format on

    final progress = caluculateProgress(todayRise, todayFall!, selectedDay);
    log("moon  rise:$todayRise set $todayFall progress $progress");

    return (activeRise: todayRise, activeFall: todayFall, progress: progress);
  }

  double caluculateProgress(
    DateTime start,
    DateTime end,
    DateTime selectedDay,
  ) {
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
