import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import '/src/domain/entity/user_preference.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import '../../domain/weather_service.dart';
import '../../infrastructure/model/metro_api_payload.dart';

// manage state of ui

class WeatherNotifier extends ChangeNotifier {
  WeatherNotifier({required this.db, required this.service});

  final IWeatherDatabase db;
  final IWeatherService service;

  final List<CityWeatherRecord> _savedCities = [];
  UnmodifiableListView<CityWeatherRecord> get savedCities =>
      UnmodifiableListView([..._savedCities]);

  late UserPreference _preference;

  String _errorMessage = "";
  String get err => _errorMessage;
  bool get hasErr => _errorMessage.isNotEmpty;

  /// active city record
  CityWeatherRecord? _activeCity;
  CityWeatherRecord? get activeCity => _activeCity;

  Future<void> changeCity(int cityId) async {
    _activeCity = _savedCities.firstWhere((e) => e.city.id == cityId);
    notifyListeners();
  }

  Future<void> loadData() async {
    try {
      _preference = await db.getPreference();

      final result = await db.getRecords();
      _savedCities.clear();
      _savedCities.addAll(result);

      _activeCity = _savedCities.firstWhere(
        (e) => e.city.id == _preference.homeItemId,
      );
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> updatePreference({int? homeCityId}) async {
    if (homeCityId != null) _preference.homeItemId = homeCityId;
    _preference = await db.updatePreference(_preference);
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

      log(" Saved record ${savedResult.toString()}");
      await updatePreference(homeCityId: cityRecord.id);
      await loadData();
      notifyListeners();
    } catch (e) {
      _errorMessage = "failed to save city";
      notifyListeners();
      log(e.toString());
    }
  }
}
