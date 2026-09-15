import 'dart:collection';

import 'package:flutter/material.dart';

import '../domain/entity/weather_record.dart';
import '../domain/weather_db.dart';
import '../domain/weather_service.dart';
import 'model/metro_api_payload.dart';

// manage state of ui

class WeatherNotifier extends ChangeNotifier {
  WeatherNotifier({required this.db, required this.service});

  final IWeatherDatabase db;
  final IWeatherService service;

  /// active city record
  CityWeatherRecord? _todayWeather;
  CityWeatherRecord? get todayWeather => _todayWeather;

  final List<CityWeatherRecord> _savedCities = [];
  UnmodifiableListView<CityWeatherRecord> get savedCities =>
      UnmodifiableListView([..._savedCities]);

  String _errorMessage = "";
  String get err => _errorMessage;
  bool get hasErr => _errorMessage.isNotEmpty;

  Future<void> changeCity(CityInfo city) async {}

  Future<void> loadData() async {
    try {
      final result = await db.getRecords();
      _savedCities.clear();
      _savedCities.addAll(result);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // gonna refresh  only home city
  Future<void> refreshHomeCity() async {}

  Future<void> addCity(CityInfo city) async {
    try {
      final req = MetroWeatherPayload(
        latitude: city.latitude,
        longitude: city.longitude,
        city: city,
        dailyItems: DailyItem.defaultItems,
        hourlyItems: HourlyItem.defaultItems,
      );

      final response = await service.fetchWeather(req);

      final cityRecord = CityRecord(
        id: city.id ?? DateTime.now().millisecondsSinceEpoch,
        latitude: city.latitude,
        longitude: city.longitude,
        name: city.name,
        country: city.countryCode,
        countryCode: city.countryCode,
        location: city.location,
        lastUpdate: DateTime.now(),
      );

      final savedResult = await db.saveRecord(
        CityWeatherRecord(
          date: DateTime.now(),
          city: cityRecord,
          dailyItems: response.dailyRecords,
          hourlyItems: response.hourlyRecord,
        ),
      );

      //TODO: refresh
    } catch (e) {
      _errorMessage = "failed to save city";
      notifyListeners();
      print(e.toString());
    }
  }
}
