import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/infrastructure/model/metro_api_extention.dart';
import 'package:weather_app/src/infrastructure/model/metro_api_response.dart';

import '../../../fixture/fixture.dart';

void main() {
  group("metro_api_response_ext ...", () {
    final response = fixture("api_response.json");

    test('Parse data successfully', () async {
      final jsonData = jsonDecode(response);
      final model = MetroApiResponse.fromJson(jsonData);

      expect(model, isA<MetroApiResponse>());
      expect(model.latitude, 23.725834);
      expect(model.longitude, 90.38015);
      expect(model.timezone, "Asia/Dhaka");
      expect(model.dailyUnits.length, 6);
      expect(model.daily.length, 6);

      expect(model.hourlyUnits.length, 7);
      expect(model.hourly.length, 7);

      expect(model.mapWeatherMessurement(.daily, 1).length, 70);
      expect(model.mapWeatherMessurement(.hourly, 1).length, 2016);
    });

    // test("", body);
  });
}
