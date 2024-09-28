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
    return WeatherMood.fastWind;
  }
}
