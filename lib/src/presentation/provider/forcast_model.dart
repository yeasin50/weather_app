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
    required this.dewPoint,
    required this.uvIndex,
    required this.wind,
    required this.windDirection,
    // required this.airQuality,
    required this.visibility,
    required this.precipitationProbability,
  });

  final WeatherMeasurement temp;
  final WeatherMeasurement rain;
  final WeatherMeasurement humadity;
  final WeatherMeasurement dewPoint;
  final WeatherMeasurement precipitationProbability;
  final WeatherMeasurement uvIndex;

  // 10m above ground
  final WeatherMeasurement wind;
  final WeatherMeasurement windDirection;
  // final WeatherMeasurement airQuality;
  final WeatherMeasurement visibility;

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
    dewPoint: _empty(.dewPoint),
    uvIndex: _empty(.uvIndex),
    wind: _empty(.windSpeed),
    windDirection: _empty(.windDirection),
    // airQuality: _empty(.airQuality),
    visibility: _empty(.visiblity),
    precipitationProbability: _empty(.precipitationProbability),
  );

  HourlyForecast updateSelected([bool value = false]) {
    return HourlyForecast(
      isSelected: value,
      time: time,
      weatherCode: weatherCode,
      temp: temp,
      rain: rain,
      humadity: humadity,
      dewPoint: dewPoint,
      uvIndex: uvIndex,
      wind: wind,
      windDirection: windDirection,
      // airQuality: airQuality,
      visibility: visibility,
      precipitationProbability: precipitationProbability,
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

    required this.moonPhase,
    required this.moonRise,
    required this.moonSet,
  });

  final WeatherMeasurement tempMin;
  final WeatherMeasurement tempMax;
  final WeatherMeasurement rain;
  final WeatherMeasurement sunrise;
  final WeatherMeasurement sunset;

  final WeatherMeasurement moonRise;
  final WeatherMeasurement moonSet;
  final WeatherMeasurement moonPhase;

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
