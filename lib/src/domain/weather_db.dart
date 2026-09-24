import 'package:flutter/material.dart';

import 'entity/user_preference.dart';
import 'entity/weather_record.dart';

abstract class IWeatherDatabase {
  const IWeatherDatabase();
  static int primaryHomeWeatherId = 0;

  Future<CityWeatherRecord> saveRecord(CityWeatherRecord record);

  /// holds all data of a single city; not just for single day
  Future<List<CityWeatherRecord>> getRecords();
  Future<bool> deleteRecord(int id);

  Future<UserPreference> updatePreference(UserPreference pref);
  Future<UserPreference> getPreference();
}

class CityWeatherRecord {
  const CityWeatherRecord({
    required this.date,
    required this.city,
    required this.dailyItems,
    required this.hourlyItems,
  });

  final DateTime date;
  final CityRecord city;
  final List<WeatherMeasurement> dailyItems;
  final List<WeatherMeasurement> hourlyItems;

  static CityWeatherRecord none = CityWeatherRecord(
    date: DateTime.now(),
    city: CityRecord.none,
    dailyItems: [],
    hourlyItems: [],
  );

  WeatherMeasurement get currentHourCode {
    if (hourlyItems.isEmpty) throw Exception("hourlyItems  is empty");
    final now = DateTime.now();
    return hourlyItems.firstWhere(
      (e) =>
          e.measurementType == .weatherCode && DateUtils.isSameDay(e.time, now),
    );
  }
}
