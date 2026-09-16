import 'package:flutter/material.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import '../../infrastructure/infrastructure.dart';

/// maintain  specific city  record and show specific hour data
class CityWeatherNotifier extends ChangeNotifier {
  CityWeatherNotifier(this._data);
  CityWeatherRecord _data;

  CityRecord get city => _data.city;

  HourlyForcast _selectedHourForecast = HourlyForcast.none;
  HourlyForcast get selectedHourForcast => _selectedHourForecast;

  List<HourlyForcast> get todaysHourlyForecast {
    return List.generate(7, (_) => HourlyForcast.none);
  }

  List<HourlyForcast> get weeklyForecast {
    return List.generate(7, (_) => HourlyForcast.none);
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
    required this.mood,
    this.isSelected = false,
  });

  final DateTime time;
  final WeatherMeasurement temp;
  final WeatherMeasurement rain;
  @Deprecated("might not want it")
  final WeatherMeasurement humadity;
  final WeatherMood mood;

  final bool isSelected;

  static WeatherMeasurement _empty(MeasurementType type) {
    return WeatherMeasurement(
      cityId: 0,
      measurementType: MeasurementType.temperature,
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
    mood: WeatherMood.midRain,
  );
}
