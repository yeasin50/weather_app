import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import 'providers.dart';

/// maintain  specific city  record and show specific hour data
/// hold 7 days data
class CityWeatherNotifier extends ChangeNotifier {
  CityWeatherNotifier(this._data, this._selectedDay);
  CityWeatherRecord _data;

  DateTime _selectedDay;
  DateTime get selectedDay => _selectedDay;
  DateTime get selectedHour => DateTime(
    _selectedDay.year,
    _selectedDay.month,
    _selectedDay.day,
    _selectedDay.hour,
  );

  CityRecord get city => _data.city;

  HourlyForecast _selectedHourForecast = HourlyForecast.none;
  HourlyForecast get selectedHourForcast => _selectedHourForecast;

  /// if missing returns empty
  WeatherMeasurement? _getItem(
    List<WeatherMeasurement>? items,
    MeasurementType type,
  ) {
    final result = items?.firstWhereOrNull((e) => e.measurementType == type);
    return result;
  }

  ///TODO: Can use single loop for all
  List<HourlyForecast> get todaysHourlyForecast {
    final List<HourlyForecast> result = [];

    final groupByHour = groupBy(_data.hourlyItems, (e) => e.time);

    final times = groupByHour.keys.toList();
    times.removeWhere(
      (e) =>
          e.isBefore(selectedHour) ||
          !e.isBefore(selectedDay.add(const Duration(days: 1))),
    );

    for (final t in times) {
      final items = groupByHour[t];
      final temp = _getItem(items, .temperature);
      final rain = _getItem(items, .rain);
      final humadity = _getItem(items, .relativeHumidity);

      assert(
        [temp, rain, humadity].every((e) => e != null),
        'temp:${temp != null} rain:${rain != null} humadity:${humadity != null}',
      );

      result.add(
        [temp, rain, humadity].any((e) => e == null)
            ? HourlyForecast.none
            : HourlyForecast(
                time: t,
                temp: temp!,
                rain: rain!,
                humadity: humadity!,
              ),
      );
    }

    return result;
  }

  List<DailyForecast> get weeklyForecast {
    final List<DailyForecast> result = [];

    final groupByHour = groupBy(_data.dailyItems, (e) => e.time);
    final times = groupByHour.keys.toList();

    for (final t in times) {
      final items = groupByHour[t];
      final tempMax = _getItem(items, .temperatureMax);
      final tempMin = _getItem(items, .temperatureMin);
      final rain = _getItem(items, .precipitationProbability);

      assert(
        [tempMin, tempMax, rain].every((e) => e != null),
        'tempMin:${tempMin != null}  tempMax:${tempMax != null} rain:${rain != null}',
      );

      result.add(
        DailyForecast(
          time: t,
          tempMin: tempMin!,
          tempMax: tempMax!,
          rain: rain!,
        ),
      );
    }

    return result;
  }

  void updateCity(CityWeatherRecord record) {
    _data = record;
    notifyListeners();
  }

  void updateHour() {}
}
