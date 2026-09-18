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
  "temperature_2m": MeasurementType.temperature,
  "relative_humidity_2m": MeasurementType.relativeHumidity,
  "rain": MeasurementType.rain,
  "precipitation_probability": MeasurementType.precipitationProbability,
  "precipitation_probability_max": MeasurementType.precipitationProbability,
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
