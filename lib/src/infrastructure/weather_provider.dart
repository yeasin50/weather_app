import 'package:flutter/material.dart';
import 'package:weather_app/src/infrastructure/model/weather_record.dart';

import '../domain/weather_db.dart';
import '../domain/weather_service.dart';

// manage state of ui

class WeatherProvider extends ChangeNotifier {
  WeatherProvider({required this.db, required this.service});

  final IWeatherDatabase db;
  final IWeatherService service;

  /// active city record
  WeatherRecord? _todayWeather;
  WeatherRecord? get todayWeather => _todayWeather;

  String _errorMessage = "";
  String get err => _errorMessage;
  bool get hasErr => _errorMessage.isNotEmpty;

  Future<void> changeCity(CityInfo city) async {}

  // gonna refresh  only home city
  Future<void> refreshHomeCity() async {}

  Future<void> addCity(CityInfo city) async {}
}
