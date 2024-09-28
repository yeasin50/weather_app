import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/domain.dart';


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
        queryParameters: payload.toMap(),
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
