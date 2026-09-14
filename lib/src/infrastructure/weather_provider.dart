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
  WeatherRecord? _todayWeather;
  WeatherRecord? get todayWeather => _todayWeather;

  final List<WeatherRecord> _savedCities = [];
  UnmodifiableListView<WeatherRecord> get savedCities =>
      UnmodifiableListView([..._savedCities]);

  String _errorMessage = "";
  String get err => _errorMessage;
  bool get hasErr => _errorMessage.isNotEmpty;

  Future<void> changeCity(CityInfo city) async {}

  // gonna refresh  only home city
  Future<void> refreshHomeCity() async {}

  Future<void> addCity(CityInfo city) async {
    try {
      final req = MetroWeatherPayload(
        latitude: city.latitude,
        longitude: city.longitude,
        dailyItems: DailyItem.defaultItems,
        hourlyItems: HourlyItem.defaultItems,
      );

      final response = await service.fetchWeather(req);

      final savedResult = await db.saveRecord(
        CityWeatherRecord(
          date: DateTime.now(),
          city: CityRecord(
            id: city.id ?? DateTime.now().millisecondsSinceEpoch,
            latitude: city.latitude,
            longitude: city.longitude,
            name: city.name,
            country: city.countryCode,
            countryCode: city.countryCode,
            location: city.location,
            lastUpdate: DateTime.now(),
          ),
          dailyItems: response.dailyRecords,
          hourlyItems: response.hourlyRecord,
        ),
      );

      print("saved item ${savedResult.city.id} ");
    } catch (e) {
      _errorMessage = "failed to save city";
      notifyListeners();
      print(e.toString());
    }
  }
}
