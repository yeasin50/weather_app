import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/domain.dart';

import 'package:http/http.dart' as http;

class MetroWeatherPayload {
  const MetroWeatherPayload({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}

class MetroWeatherRepo {
  final uri = Uri(
    scheme: "https",
    host: "api.open-meteo.com",
  );

  /// on success pass the response,  on Error pass the error String
  Future<(MetroApiResponse?, String?)> fetchWeather(MetroWeatherPayload payload) async {
    try {
      final url = uri.replace(
        path: "/v1/forecast",
        queryParameters: {
          "latitude": payload.latitude.toString(),
          "longitude": payload.longitude.toString(),
          "hourly": "temperature_2m",
          "daily": "sunrise",
          "timezone": "Asia/Singapore",
          "past_days": "1"
        },
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        return (null, "Server failure");
      }

      final data = jsonDecode(response.body);
      MetroApiResponse model = MetroApiResponse.fromMap(data);

      return (model, null);
    } catch (e, trace) {
      debugPrint("$e\n$trace");
      return (null, e.toString());
    }
  }
}
