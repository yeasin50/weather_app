import 'package:freezed_annotation/freezed_annotation.dart';
import '/src/domain/weather_service.dart';

part 'metro_api_response.g.dart';
part 'metro_api_response.freezed.dart';

@freezed
abstract class MetroApiCityInfo with _$MetroApiCityInfo {
  const MetroApiCityInfo._();

  const factory MetroApiCityInfo({
    int? id,
    required double latitude,
    required double longitude,
    required String name,
    required String country,
    required String countryCode,

    /// location parts,why  customConverter for simple
    String? admin1,
    String? admin2,
    // String? admin3,
  }) = _MetroApiCityInfo;

  factory MetroApiCityInfo.fromJson(Map<String, dynamic> json) =>
      _$MetroApiCityInfoFromJson(json);

  CityInfo toDB() {
    return CityInfo(
      id: id ?? DateTime.now().millisecondsSinceEpoch,
      name: name,
      latitude: latitude,
      longitude: longitude,
      countryCode: countryCode,
      location: [admin2, admin1].where((e) => e != null).join(", "),
    );
  }
}

@freezed
class MetroApiResponse with _$MetroApiResponse {
  const MetroApiResponse._();

  const factory MetroApiResponse({
    required double latitude,
    required double longitude,
    required String timezone,
    required Map<String, String> hourlyUnits,
    required Map<String, List<dynamic>> hourly,
    required Map<String, String> dailyUnits,
    required Map<String, List<dynamic>> daily,
  }) = _MetroApiResponse;

  factory MetroApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MetroApiResponseFromJson(json);
}
