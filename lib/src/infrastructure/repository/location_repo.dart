import '../../domain/entity/city_info.dart';

class LocationRepo {
  // https://geocoding-api.open-meteo.com/v1/search
  final geoUri = Uri(scheme: "https", host: "geocoding-api.open-meteo.com/v1/search");

  final List<CityInfo> _lastSearchedCity = [];

  Stream<List<CityInfo>> searchCity(String query) async* {
    if (query.isEmpty) yield _lastSearchedCity;

    //search city

    ///
    yield [];
  }

  /// saved from local db
  Future<List<CityInfo>> _savedCity() async {
    return [];
  }
}
