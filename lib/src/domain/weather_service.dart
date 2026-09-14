import 'package:freezed_annotation/freezed_annotation.dart';
import './entity/weather_record.dart';

part 'weather_service.g.dart';
part 'weather_service.freezed.dart';

abstract class IWeatherService {
  void searchCity(String query);
  Stream<List<CityInfo>> get searchedCityResult;

  Future<WeatherResponse> fetchWeather(WeatherRequest req);
}

@freezed
sealed class CityInfo with _$CityInfo {
  const factory CityInfo({
    required String name,
    required double latitude,
    required double longitude,
    required String countryCode,
    required String location, //except city
  }) = _CityInfo;

  factory CityInfo.fromJson(Map<String, dynamic> json) =>
      _$CityInfoFromJson(json);
}

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required WeatherRecord record,
    required List<WeatherMeasurement> dailyRecords,
    required List<WeatherMeasurement> hourlyRecord,
  }) = _WeatherResponse;
}

abstract class WeatherRequest {
  const WeatherRequest();
  Map<String, dynamic> get toQuery;
}
