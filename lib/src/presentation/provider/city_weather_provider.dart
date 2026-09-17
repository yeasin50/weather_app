import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import '../../infrastructure/infrastructure.dart';

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

  HourlyForcast _selectedHourForecast = HourlyForcast.none;
  HourlyForcast get selectedHourForcast => _selectedHourForecast;

  /// if missing returns empty
  WeatherMeasurement? _getItem(
    List<WeatherMeasurement>? items,
    MeasurementType type,
  ) {
    final result = items?.firstWhereOrNull((e) => e.measurementType == type);
    return result;
  }

  ///TODO: Can use single loop for all
  List<HourlyForcast> get todaysHourlyForecast {
    final List<HourlyForcast> result = [];

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
            ? HourlyForcast.none
            : HourlyForcast(
                time: t,
                temp: temp!,
                rain: rain!,
                humadity: humadity!,
              ),
      );
    }

    return result;
  }

  List<HourlyForcast> get weeklyForecast {
    return [];
  }

  void updateCity(CityWeatherRecord record) {
    _data = record;
    notifyListeners();
  }

  void updateHour() {}
}

class HourlyForcast {
  HourlyForcast({
    required this.time,
    required this.temp,
    required this.rain,
    required this.humadity,
    this.isSelected = false,
  });

  final DateTime time;
  final WeatherMeasurement temp;
  final WeatherMeasurement rain;
  @Deprecated("might not want it")
  final WeatherMeasurement humadity;

  final bool isSelected;

  WeatherMood get mood => WeatherMood.midRain; //TODO: calculate

  static WeatherMeasurement _empty(MeasurementType type) {
    return WeatherMeasurement(
      cityId: 0,
      measurementType: type,
      time: DateTime.now(),
      unit: "c",
      value: "20",
      interval: MeasurementInterval.hourly,
    );
  }

  @deprecated
  static HourlyForcast none = HourlyForcast(
    time: DateTime.now(),
    temp: _empty(MeasurementType.temperature),
    rain: _empty(MeasurementType.rain),
    humadity: _empty(MeasurementType.relativeHumidity),
  );
}
