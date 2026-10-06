import '/src/domain/entity/weather_record.dart';

import 'metro_api_response.dart';

extension MetroApiExt on MetroApiResponse {
  List<WeatherMeasurement> mapWeatherMessurement(
    MeasurementInterval interval,
    int cityId,
  ) {
    final List<WeatherMeasurement> result = [];

    final times = interval.isHourly ? hourly["time"] : daily["time"];
    if (times is! List || (times).isEmpty) {
      throw Exception("time on ${interval.name} record should be list");
    }

    final List<DateTime> days = [];
    for (final t in times) {
      final time = DateTime.tryParse(t);
      if (time == null) throw Exception("invalid dateTime on `times`");
      days.add(time);
    }

    /// { x:[], y: [], ... } except the time
    final entriesToBeRecord = (interval.isHourly ? hourly.keys : daily.keys)
        .where((e) => e != "time")
        .toList();

    if (entriesToBeRecord.isEmpty) return [];

    for (int i = 0; i < entriesToBeRecord.length; i++) {
      final key = entriesToBeRecord[i];
      final unit = interval.isHourly ? hourlyUnits[key] : dailyUnits[key];
      if (unit == null) {
        throw Exception("missing ${interval.name}_units on record for $key");
      }

      // specific key's list of items
      final keyItems = (interval.isHourly ? hourly[key] : daily[key]) ?? [];

      assert(keyItems.length == days.length, "should be same");

      for (int x = 0; x < keyItems.length; x++) {
        final value = keyItems[x];

        result.add(
          WeatherMeasurement(
            cityId: cityId,
            time: days[x],
            unit: unit,
            value: value.toString(),
            interval: interval,
            measurementType: _measureFromStr(key),
          ),
        );
      }
    }

    return result;
  }
}

final Map<String, MeasurementType> _measureTypeMap = {
  // Hourly strings
  "temperature_2m": .temperature,
  "apparent_temperature": .tempFeelsLike,

  "relative_humidity_2m": .relativeHumidity,
  "dew_point_2m": .dewPoint,
  "rain": .rain,
  "precipitation_probability": .precipitationProbability,
  "precipitation_probability_max": .precipitationProbability,

  "uv_index": .uvIndex,

  "wind_speed_10m": .windSpeed,
  "wind_gusts_10m": .windGusts,
  "wind_direction_10m": .windDirection,

  "visibility": .visiblity,

  // Daily strings
  "temperature_2m_max": MeasurementType.temperatureMax,
  "temperature_2m_min": MeasurementType.temperatureMin,
  "weather_code": MeasurementType.weatherCode,

  "sunrise": MeasurementType.sunrise,
  "sunset": MeasurementType.sunset,
  "daylight_duration": .daylightDuration,
  "sunshine_duration": .sunshineDuration,

  "moon_phase": .moonPhase,
  "moonrise": .moonRise,
  "moonset": .moonSet,
};

MeasurementType _measureFromStr(String str) {
  final result = _measureTypeMap[str] ?? .unknown;
  assert(result != .unknown, "handle MeasurementType $str");
  return result;
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
