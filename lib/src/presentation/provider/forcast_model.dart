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

///SunMoon rise set
class StarForecast extends ForecastData {
  StarForecast({required super.time, required WeatherMeasurement value})
    : super(weatherCode: value, isSelected: false);

  WeatherMeasurement get value => super.weatherCode;
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

  HourlyForecast updateSelected([bool value = false]) {
    return HourlyForecast(
      isSelected: value,
      time: time,
      weatherCode: weatherCode,
      temp: temp,
      rain: rain,
      humadity: humadity,
    );
  }
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
    required this.sunrise,
    required this.sunset,
  });

  final WeatherMeasurement tempMin;
  final WeatherMeasurement tempMax;
  final WeatherMeasurement rain;
  final WeatherMeasurement sunrise;
  final WeatherMeasurement sunset;

  WeatherMood get mood => WeatherMood.midRain;
}

extension DailyForeCastExt on DailyForecast {
  StarForecast get toSunset {
    return StarForecast(
      time: DateTime.parse(sunset.value),
      value: WeatherMeasurement(
        cityId: sunset.cityId,
        measurementType: sunset.measurementType,
        time: sunset.time,
        unit: sunset.unit,
        value: sunset.value,
        interval: sunset.interval,
      ),
    );
  }

  StarForecast get toSunrise {
    return StarForecast(
      time: DateTime.parse(sunrise.value),
      value: WeatherMeasurement(
        cityId: sunrise.cityId,
        measurementType: sunrise.measurementType,
        time: sunrise.time,
        unit: sunrise.unit,
        value: sunrise.value,
        interval: sunrise.interval,
      ),
    );
  }
}
