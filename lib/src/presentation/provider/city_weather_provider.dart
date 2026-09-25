import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import '../common/common.dart';
import 'providers.dart';

/// maintain  specific city  record and show specific hour data
/// hold 7 days data
class CityWeatherNotifier extends ChangeNotifier {
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

  /// if missing returns empty
  WeatherMeasurement? _getItem(
    List<WeatherMeasurement>? items,
    MeasurementType type,
  ) {
    final result = items?.firstWhereOrNull((e) => e.measurementType == type);
    return result;
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

  // TODO: inject sunrise and sunset
  List<HourlyForecast> _todaysHourlyForecast = [];
  UnmodifiableListView<ForecastData> get todaysHourlyForecast {
    return UnmodifiableListView(_mergeSunriseAndSunset(_todaysHourlyForecast));
  }

  List<DailyForecast> _dailyForecast = [];
  UnmodifiableListView<DailyForecast> get weeklyForecast =>
      UnmodifiableListView(_dailyForecast);

  ///TODO: Can use single loop for all
  List<HourlyForecast> _parseTodaysHourlyForecast() {
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
        humadity: humadity!,
      );

      result.add(forecast);
    }

    if (result.isNotEmpty) result[0] = result[0].updateSelected(true);

    return result;
  }

  List<DailyForecast> _parseWeeklyForecast() {
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
        ),
      );
    }

    return result;
  }

  void updateCity(CityWeatherRecord record) {
    _data = record;
    _dailyForecast = _parseWeeklyForecast();
    _todaysHourlyForecast = _parseTodaysHourlyForecast();

    notifyListeners();
  }

  void updateHour(DateTime date) {
    _selectedDay = date;
    notifyListeners();
  }
}
