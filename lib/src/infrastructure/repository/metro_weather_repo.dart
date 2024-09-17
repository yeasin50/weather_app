import 'dart:convert';

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
  static const baseUrl = "https://api.open-meteo.com/v1";

  /// on success pass the response,  on Error pass the error String
  Future<(MetroApiResponse?, String?)> fetchWeather(MetroWeatherPayload payload) async {
    final url =
        "$baseUrl/forecast?latitude=${payload.latitude}&longitude=${payload.longitude}&hourly=temperature_2m,relative_humidity_2m,rain&daily=sunrise&timezone=Asia%2FSingapore&past_days=1";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return (null, "Server failure");
    }

    final data = jsonDecode(response.body);
    MetroApiResponse model = MetroApiResponse.fromMap(data);

    return (model, null);
  }
}
