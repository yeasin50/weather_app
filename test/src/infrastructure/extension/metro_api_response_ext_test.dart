import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/extension/metro_api_response_ext.dart';
import 'package:weather_app/src/infrastructure/infrastructure.dart';

import '../../../fixture/fixture.dart';

void main() {
  group("metro_api_response_ext ...", () {
    final response = fixture("api_response.json");
    final jsonData = jsonDecode(response);

    final model = MetroApiResponse.fromMap(jsonData);

    test('HourlyWeatherInfo shouldn\'t be null ...', () async {
      final todayWeather = model.getCurrentHourWeather(DateTime.now());

      expect(todayWeather != null, true);
      expect(todayWeather, isA<HourlyWeatherInfo>());
    });

    test("weeklyForecast shouldn't be null", () {
      final todayWeather = model.weeklyForecast;

      expect(todayWeather.isNotEmpty, true);
      for (final w in todayWeather) {
        print(w.date.day);
      }
    });
  });
}
