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
    required this.utcSecondOffset,
  });

  final Id id;
  final double latitude;
  final double longitude;
  final String name;
  final String country;
  final String countryCode;
  final String location;

  /// open metro  gives us offset in-case we would like to adjust the time
  final int utcSecondOffset;

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
    utcSecondOffset: 0,
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
  tempFeelsLike,

  relativeHumidity,
  dewPoint,
  rain,
  precipitationProbability,
  uvIndex,
  windSpeed,
  windGusts,
  windDirection,
  sunrise,
  sunset,
  moonPhase,
  moonRise,
  moonSet,
  weatherCode,
  daylightDuration,
  sunshineDuration,

  airQuality,
  visiblity,
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

  static WeatherMeasurement emptyW = WeatherMeasurement(
    cityId: 12,
    measurementType: .temperature,
    time: DateTime.now(),
    unit: "",
    value: "12",
    interval: .daily,
  );

  WeatherMeasurement copyWith({
    MeasurementType? measurementType,
    DateTime? time,
    String? unit,
    String? value,
    MeasurementInterval? interval,
  }) {
    return WeatherMeasurement(
      cityId: cityId,
      measurementType: measurementType ?? this.measurementType,
      time: time ?? this.time,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      interval: interval ?? this.interval,
    );
  }

  @override
  String toString() {
    return "WeatherMeasurement(time:$time, value:$value, unit:$unit)";
  }
}
