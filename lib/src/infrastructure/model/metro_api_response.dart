import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';
import 'package:weather_app/src/domain/weather_service.dart';

part 'metro_api_response.g.dart';
part 'metro_api_response.freezed.dart';

@freezed
abstract class MetroApiCityInfo with _$MetroApiCityInfo {
  const MetroApiCityInfo._();

  const factory MetroApiCityInfo({
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
    required Map<String, List<dynamic>>? hourly,
    required Map<String, String> dailyUnits,
    required Map<String, List<dynamic>>? daily,
  }) = _MetroApiResponse;

  factory MetroApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MetroApiResponseFromJson(json);
}

extension MetroApiExt on MetroApiResponse {
  WeatherRecord get record => WeatherRecord(
    id: DateTime.now().millisecondsSinceEpoch,
    date: DateTime.now(), // ? 0_o
    lastUpdate: DateTime.now(),
  );

  List<WeatherMeasurement> dailyRecords(int weatherId) {
    final List<WeatherMeasurement> result = [];

    final times = daily?["times"];
    if (times == null || times is! List<String>) {
      throw Exception("time on daily record on should be list");
    }

    final List<DateTime> days = [];
    for (final t in times) {
      final time = DateTime.tryParse(t);
      if (time == null) throw Exception("invalid dateTime on `times`");
      days.add(time);
    }

    // well, time is first :)
    final entriesToBeRecord = (daily?.keys ?? []).skip(1).toList();
    if (entriesToBeRecord.isEmpty) return [];

    for (int i = 0; i < entriesToBeRecord.length; i++) {
      final key = entriesToBeRecord[i];
      final unit = dailyUnits[key];
      if (unit == null) {
        throw Exception("missing daily_units on daily record for $key");
      }

      WeatherMeasurement(
        id: DateTime.now().millisecondsSinceEpoch,
        weatherId: weatherId,
        time: days[i],
        unit: unit,
        value: daily![key]![i], //xd
        interval: MeasurementInterval.daily,
        measurementType: _measureFromStr(key),
      );
    }

    return result;
  }

  List<WeatherMeasurement> hourlyRecords(int weatherId) {
    final List<WeatherMeasurement> result = [];

    final times = hourly?["times"];
    if (times == null || times is! List<String>) {
      throw Exception("time on daily record on should be list");
    }

    final List<DateTime> days = [];
    for (final t in times) {
      final time = DateTime.tryParse(t);
      if (time == null) throw Exception("invalid dateTime on `times`");
      days.add(time);
    }

    // well, time is first :)
    final entriesToBeRecord = (hourly?.keys ?? []).skip(1).toList();
    if (entriesToBeRecord.isEmpty) return [];

    for (int i = 0; i < entriesToBeRecord.length; i++) {
      final key = entriesToBeRecord[i];
      final unit = hourlyUnits[key];
      if (unit == null) {
        throw Exception("missing hourly_units on daily record for $key");
      }

      WeatherMeasurement(
        id: DateTime.now().millisecondsSinceEpoch,
        weatherId: weatherId,
        time: days[i],
        unit: unit,
        value: hourly![key]![i], //xd
        interval: MeasurementInterval.daily,
        measurementType: _measureFromStr(key),
      );
    }

    return result;
  }
}

final Map<String, MeasurementType> _measureTypeMap = {
  // Hourly strings
  "temperature_2m": MeasurementType.temperature,
  "relative_humidity_2m": MeasurementType.relativeHumidity,
  "rain": MeasurementType.rain,
  "precipitation_probability": MeasurementType.precipitationProbability,
  "uv_index": MeasurementType.uvIndex,
  "wind_speed_10m": MeasurementType.windSpeed,

  // Daily strings
  "sunrise": MeasurementType.sunrise,
  "sunset": MeasurementType.sunset,
  "moon_phase": MeasurementType.moonPhase,
  "temperature_2m_max": MeasurementType.temperatureMax,
  "temperature_2m_min": MeasurementType.temperatureMin,
};

MeasurementType _measureFromStr(String str) {
  return _measureTypeMap[str] ?? MeasurementType.unknown;
}

//
String _strFromMeasure(MeasurementType type) {
  return _measureTypeMap.entries
      .firstWhere(
        (e) => e.value == type,
        orElse: () => const MapEntry("unknown", MeasurementType.unknown),
      )
      .key;
}
