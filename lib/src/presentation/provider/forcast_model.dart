import '../../domain/entity/weather_record.dart';
import '../../infrastructure/infrastructure.dart';

sealed class ForecastData {
  const ForecastData({required this.time, required this.isSelected});
  final DateTime time;
  final bool isSelected;
}

class HourlyForecast extends ForecastData {
  HourlyForecast({
    required super.time,
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
    temp: _empty(MeasurementType.temperature),
    rain: _empty(MeasurementType.rain),
    humadity: _empty(MeasurementType.relativeHumidity),
  );
}

// for 7 days
class DailyForecast extends ForecastData {
  DailyForecast({
    required super.time,
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
