import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:stream_transform/stream_transform.dart';

import '../../domain/entity/city_info.dart';

class LocationRepo {
  List<CityInfo> _lastSearchedCity = [];

  final StreamController _queryController = StreamController<String>();

  late final Stream<List<CityInfo>> dataStream = _queryController.stream
      .debounce(const Duration(milliseconds: 300)) //
      .asyncMap<List<CityInfo>>(
    (q) async {
      final result = await searchCity(q);
      debugPrint("query $q : result ${result.length}");
      _lastSearchedCity = [...result];
      return _lastSearchedCity;
    },
  );

  void searchWithDelay(String q) {
    _queryController.add(q);
  }

  void dispose() {
    _queryController.close();
  }

  Future<List<CityInfo>> searchCity(String query) async {
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
        return [];
      }

      final data = jsonDecode(response.body);

      final cityData = data["results"];
      if (cityData == null) return [];

      final cities = List<CityInfo>.from(cityData.map((e) => CityInfo.fromMap(e)));
      return cities;
    } catch (e, trace) {
      debugPrint("$e\n $trace");
      return [];
    }
  }
}
