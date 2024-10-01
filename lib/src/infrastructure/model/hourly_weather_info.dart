import '../infrastructure.dart';

class HourlyWeatherInfo {
  const HourlyWeatherInfo({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.rain,
  });

  static HourlyWeatherInfo none = HourlyWeatherInfo(
    date: DateTime.now(),
    temperature: 0,
    humidity: 0,
    rain: 0,
  );

  final DateTime date;
  final double temperature;
  final int humidity;
  final double rain;

  HourlyWeatherInfo operator +(HourlyWeatherInfo other) {
    return HourlyWeatherInfo(
      date: date,
      temperature: temperature + other.temperature,
      humidity: humidity + other.humidity,
      rain: rain + other.rain,
    );
  }

  WeatherMood get mood {
    if (rain > 50) {
      if (humidity > 80) {
        return WeatherMood.tornado;
      }
      return WeatherMood.showers;
    } else if (rain > 20) {
      // Moderate rain
      return WeatherMood.midRain;
    } else if (temperature < 10) {
      return WeatherMood.fastWind;
    }
    return WeatherMood.fastWind;
  }

  HourlyWeatherInfo copyWith({
    DateTime? date,
    double? temperature,
    int? humidity,
    double? rain,
  }) {
    return HourlyWeatherInfo(
      date: date ?? this.date,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      rain: rain ?? this.rain,
    );
  }
}
