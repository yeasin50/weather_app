// ignore_for_file: constant_identifier_names

enum HourlyItem {
  temperature_2m,
  relative_humidity_2m,
  rain,
  ;

  static get defaultItems => [temperature_2m, relative_humidity_2m, rain];
}

class MetroWeatherPayload {
  const MetroWeatherPayload({
    required this.latitude,
    required this.longitude,
    required this.hourlyItems,
  });

  final double latitude;
  final double longitude;
  final List<HourlyItem> hourlyItems;

  Map<String, dynamic> toMap() {
    final hourly = hourlyItems.map((e) => e.name).join(",");
    return {
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "hourly": hourly,
      "daily": "sunrise",
      "timezone": "Asia/Singapore",
      "past_days": "1"
    };
  }

  @override
  String toString() => 'MetroWeatherPayload(latitude: $latitude, longitude: $longitude)';
}
