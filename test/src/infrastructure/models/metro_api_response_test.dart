import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/infrastructure/model/metro_api_response.dart';

import '../../../fixture/fixture.dart';

void main() {
  group("metro_api_response_ext ...", () {
    final response = fixture("api_response2.json");
    final jsonData = jsonDecode(response);
    final model = MetroApiResponse.fromJson(jsonData);

    test('Parse data successfully', () async {
      expect(model, isA<MetroApiResponse>());
      expect(model.latitude, 23.796133);
      expect(model.longitude, 90.38055);
      expect(model.timezone, "Asia/Dhaka");
      expect(model.dailyUnits.length, 7);
      expect(model.daily?.length, 7);

      expect(model.hourlyUnits.length, 7);
      expect(model.hourly?.length, 7);
    });

    // test("", body);
  });
}
