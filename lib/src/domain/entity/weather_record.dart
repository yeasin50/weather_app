import 'package:isar_community/isar.dart';

part 'weather_record.g.dart';

@collection
class CityRecord {
  const CityRecord({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.country,
    required this.countryCode,
    required this.lastUpdate,
  });

  final Id id;
  final double latitude;
  final double longitude;
  final String name;
  final String country;
  final String countryCode;
  final String location;

  /// expect city[name]
  final DateTime lastUpdate;

  static CityRecord none = CityRecord(
    id: 0,
    name: "",
    latitude: 0,
    longitude: 0,
    location: "",
    country: "",
    countryCode: "",
    lastUpdate: DateTime.now(),
  );
}

enum MeasurementInterval {
  hourly,
  daily;

  bool get isHourly => this == MeasurementInterval.hourly;
}

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
  WeatherMeasurement({
    required this.cityId,
    required this.measurementType,
    required this.time,
    required this.unit,
    required this.value,
    required this.interval,
  });

  Id id = Isar.autoIncrement;
  final int cityId;

  @Enumerated(EnumType.name)
  final MeasurementType measurementType;
  final DateTime time;
  final String unit;
  final String value;

  @Enumerated(EnumType.name)
  final MeasurementInterval interval;
}
