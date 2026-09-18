import '../../domain/entity/weather_record.dart';
import '../../infrastructure/infrastructure.dart';

sealed class ForecastData {
  const ForecastData({
    required this.time,
    required this.weatherCode,
    required this.isSelected,
  });
  final DateTime time;
  final WeatherMeasurement weatherCode;
  final bool isSelected;
}

class HourlyForecast extends ForecastData {
  HourlyForecast({
    required super.time,
    required super.weatherCode,
    super.isSelected = false,
    required this.temp,
    required this.rain,
    required this.humadity,
  });

  final WeatherMeasurement temp;
  final WeatherMeasurement rain;
  @Deprecated("might not want it")
  final WeatherMeasurement humadity;

  WeatherMood get mood => WeatherMood.midRain; //TODO: calculate

  static WeatherMeasurement _empty(MeasurementType type) {
    return WeatherMeasurement(
      cityId: 0,
      measurementType: type,
      time: DateTime.now(),
      unit: "c",
      value: "20",
      interval: MeasurementInterval.hourly,
    );
  }

  @deprecated
  static HourlyForecast none = HourlyForecast(
    time: DateTime.now(),
    weatherCode: _empty(.weatherCode),
    temp: _empty(.temperature),
    rain: _empty(.rain),
    humadity: _empty(.relativeHumidity),
  );
}

// for 7 days
class DailyForecast extends ForecastData {
  DailyForecast({
    required super.time,
    required super.weatherCode,
    super.isSelected = false,
    required this.rain,
    required this.tempMin,
    required this.tempMax,
  });

  final WeatherMeasurement tempMin;
  final WeatherMeasurement tempMax;
  final WeatherMeasurement rain;

  WeatherMood get mood => WeatherMood.midRain;
}
