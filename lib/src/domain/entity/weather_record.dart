import 'package:isar/isar.dart';

part 'weather_record.g.dart';

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

enum WeatherRecordType { hourly, daily }

//TODO: better naming
@collection
class DailyRecord {
  const DailyRecord({
    required this.id,
    required this.weatherId,
    required this.time,
    required this.unit,
    required this.value,
    required this.type,
  });

  final int id;
  final int weatherId;
  final DateTime time;
  final String unit;
  final dynamic value;
  final WeatherRecordType type;
}
