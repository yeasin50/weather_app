import 'package:isar/isar.dart';

@collection
class WeatherRecord {
  WeatherRecord({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.country,
    required this.countryCode,
    this.isPrimaryCity = false,
  });

  final int id;
  final double latitude;
  final double longitude;
  final String name;
  final String country;
  final String countryCode;
  final bool isPrimaryCity;
}

@collection
class HourlyRecord {
  const HourlyRecord({
    required this.id,
    required this.weatherId,
    required this.time,
    required this.temp,
    required this.humidity,
    required this.rain,
  });

  final int id;
  final int weatherId;
  final List<DateTime> time;
  final List<double> temp;
  final List<int> humidity;
  final List<double> rain;

  factory HourlyRecord.fromMap(Map<String, dynamic> map) {
    return HourlyRecord(
      id: DateTime.now().millisecondsSinceEpoch,
      weatherId: 0,
      time: List<DateTime>.from(map['time']?.map((x) => DateTime.parse(x))),
      temp: List<double>.from(map['temperature_2m']),
      humidity: List<int>.from(map['relative_humidity_2m']),
      rain: List<double>.from(map['rain']),
    );
  }
}

@collection
class DailyRecord {
  const DailyRecord({
    required this.id,
    required this.weatherId,
    required this.time,
    required this.sunrise,
  });

  final int id;
  final int weatherId;
  final List<DateTime> time;
  final List<DateTime> sunrise;

  factory DailyRecord.fromMap(Map<String, dynamic> map) {
    return DailyRecord(
      id: DateTime.now().millisecondsSinceEpoch,
      weatherId: 0,
      time: List<DateTime>.from(map['time']?.map((x) => DateTime.parse(x))),
      sunrise: List<DateTime>.from(
        map['sunrise']?.map((x) => DateTime.parse(x)),
      ),
    );
  }
}
