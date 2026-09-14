import 'package:isar/isar.dart';

part 'weather_record.g.dart';

@collection
class CityRecord {
  CityRecord({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.lastUpdate,
  });

  final int id;
  final double latitude;
  final double longitude;
  final String name;
  final String country;
  final String countryCode;
  final DateTime lastUpdate;
}

@collection
class WeatherRecord {
  WeatherRecord({
    required this.id,
    required this.date,
    required this.lastUpdate,
  });

  final int id;
  final DateTime date;
  final DateTime lastUpdate;
}

enum MeasurementInterval { hourly, daily }

enum MeasurementType {
  temperature,
  temperatureMax,
  temperatureMin,
  relativeHumidity,
  rain,
  precipitationProbability,
  uvIndex,
  windSpeed,
  sunrise,
  sunset,
  moonPhase,
  unknown,
}

@collection
class WeatherMeasurement {
  const WeatherMeasurement({
    required this.id,
    required this.weatherId,
    required this.measurementType,
    required this.time,
    required this.unit,
    required this.value,
    required this.interval,
  });

  final int id;
  final int weatherId;
  final MeasurementType measurementType;
  final DateTime time;
  final String unit;
  final dynamic value;
  final MeasurementInterval interval;
}
