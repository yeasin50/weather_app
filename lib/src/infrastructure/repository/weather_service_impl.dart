import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:stream_transform/stream_transform.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';

import '../../domain/weather_service.dart';
import '../model/metro_api_response.dart';

class MetroApiServce implements IWeatherService {
  List<CityInfo> _lastSearchedCity = [];

  final StreamController _queryController = StreamController<String>();
  void dispose() => _queryController.close();

  @override
  Stream<List<CityInfo>> searchCity(String query) => _queryController.stream
      .debounce(const Duration(milliseconds: 300)) //
      .asyncMap<List<CityInfo>>((q) async {
        try {
          final result = await _searchCity(q);
          debugPrint("query $q : result ${result.length}");
          _lastSearchedCity = [...result];
          return _lastSearchedCity;
        } catch (e) {
          return Future.error(e.toString());
        }
      });

  Future<List<CityInfo>> _searchCity(String query) async {
    try {
      final geoUri = Uri(
        scheme: "https",
        host: "geocoding-api.open-meteo.com",
        path: "/v1/search",
      );

      final response = await http.get(
        geoUri.replace(queryParameters: {"name": query}),
      );

      if (response.statusCode != 200) {
        debugPrint(response.body);
        throw Exception("${response.statusCode} : failed to get city");
      }

      final data = jsonDecode(response.body);
      final cityData = data["results"];
      if (cityData == null) throw Exception("no city found");

      final cities = List<MetroApiCityInfo>.from(
        cityData.map((e) => MetroApiCityInfo.fromJson(e)),
      ).map((e) => e.toDB()).toList();

      return cities;
    } catch (e, trace) {
      debugPrint("$e\n $trace");
      return [];
    }
  }

  @override
  Future<WeatherResponse> fetchWeather(WeatherRequest req) async {
    final uri = Uri(scheme: "https", host: "api.open-meteo.com");

    try {
      final url = uri.replace(
        path: "/v1/forecast",
        queryParameters: req.toQuery,
      );

      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception(" ${response.statusCode}: Server failure");
      }

      final data = jsonDecode(response.body);
      MetroApiResponse result = MetroApiResponse.fromJson(data);

      final record = result.record;
      return WeatherResponse(
        record: record,
        dailyRecords: result.dailyRecords(record.id),
        hourlyRecord: result.hourlyRecords(record.id),
      );
    } catch (e, trace) {
      debugPrint("$e\n$trace");
      throw Exception("failed to fix it");
    }
  }
}
