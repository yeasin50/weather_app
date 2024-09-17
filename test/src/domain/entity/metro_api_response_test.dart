import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/domain/domain.dart';

import '../../../fixture/fixture.dart';

void main() {
  test('check metro api response ...', () async {
    final response = fixture("api_response.json");
    final jsonData = jsonDecode(response);

    final model = MetroApiResponse.fromMap(jsonData);
  });
}
