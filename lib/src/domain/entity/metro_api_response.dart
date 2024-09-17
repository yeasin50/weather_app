class MetroApiResponse {
  MetroApiResponse({
    required this.latitude,
    required this.longitude,
    required this.timeZone,
    required this.timeZoneAbbreviation,
    required this.hourlyData,
    required this.daily,
  });

  final double latitude;
  final double longitude;

  final String timeZone;
  final String timeZoneAbbreviation;

  final HourlyData hourlyData;

  final Daily daily;

  factory MetroApiResponse.fromMap(Map<String, dynamic> map) {
    return MetroApiResponse(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      timeZone: map['timeZone'] ?? '',
      timeZoneAbbreviation: map['timezone_abbreviation'] ?? '',
      hourlyData: HourlyData.fromMap(map['hourly']),
      daily: Daily.fromMap(map['daily']),
    );
  }
}

class HourlyData {
  const HourlyData({
    required this.time,
    required this.temp,
    required this.humidity,
    required this.rain,
  });

  final List<DateTime> time;
  final List<double> temp;
  final List<int> humidity;
  final List<double> rain;

  factory HourlyData.fromMap(Map<String, dynamic> map) {
    return HourlyData(
      time: List<DateTime>.from(map['time']?.map((x) => DateTime.parse(x))),
      temp: List<double>.from(map['temperature_2m']),
      humidity: List<int>.from(map['relative_humidity_2m']),
      rain: List<double>.from(map['rain']),
    );
  }
}

class Daily {
  Daily({
    required this.time,
    required this.sunrise,
  });

  final List<DateTime> time;
  final List<DateTime> sunrise;

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      time: List<DateTime>.from(map['time']?.map((x) => DateTime.parse(x))),
      sunrise: List<DateTime>.from(map['sunrise']?.map((x) => DateTime.parse(x))),
    );
  }
}
