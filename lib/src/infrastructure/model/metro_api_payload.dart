import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/weather_service.dart';

part 'metro_api_payload.freezed.dart';
part 'metro_api_payload.g.dart';

//TODO: Might change into  simple objects for daily &  hourly items
@freezed
abstract class MetroWeatherPayload extends WeatherRequest
    with _$MetroWeatherPayload {
  const MetroWeatherPayload._();

  factory MetroWeatherPayload({
    required CityInfo city,

    @deprecated required double latitude,
    @deprecated required double longitude,

    required List<HourlyItem> hourlyItems,
    required List<DailyItem> dailyItems,
    @Default("auto") String timezone,
    @Default(0) int pastDays,
  }) = _MetroWeatherPayload;

  factory MetroWeatherPayload.fromJson(Map<String, dynamic> json) =>
      _$MetroWeatherPayloadFromJson(json);

  factory MetroWeatherPayload.defaultRequest({
    @deprecated required double latitude,
    @deprecated required double longitude,
    required CityInfo city,
  }) {
    return MetroWeatherPayload(
      city: city,
      latitude: latitude,
      longitude: longitude,
      hourlyItems: HourlyItem.defaultItems,
      dailyItems: DailyItem.defaultItems,
    );
  }

  @override
  Map<String, dynamic> get toQuery => {
    "latitude": city.latitude.toString(),
    "longitude": city.longitude.toString(),
    "hourly": hourlyItems.map((e) => e.value).join(","),
    "daily": dailyItems.map((e) => e.value).join(","),
    "timezone": timezone,
    "past_days": pastDays.toString(),
  };
}

//TODO: Replace with  enhanced enum
//TODO: merge with db layer and returns domain string
@JsonEnum(valueField: "value")
enum HourlyItem {
  weatherCode("weather_code"),
  temperature2m("temperature_2m"),
  relativeHumidity2m("relative_humidity_2m"),
  rain("rain"),
  precipitationProbability("precipitation_probability"),
  uvIndex("uv_index"),
  windSpeed10m("wind_speed_10m");

  const HourlyItem(this.value);
  final String value;

  static List<HourlyItem> get defaultItems => [
    weatherCode,
    temperature2m,
    relativeHumidity2m,
    rain,
    precipitationProbability,
    uvIndex,
    windSpeed10m,
  ];
}

@JsonEnum(valueField: "value")
enum DailyItem {
  weatherCode("weather_code"),
  temperatureMax("temperature_2m_max"),
  temperatureMin("temperature_2m_min"),
  rainMax("precipitation_probability_max"),

  sunrise("sunrise"),
  sunset("sunset"),
  daylightDuration("daylight_duration"),
  sunshineDuration("sunshine_duration"),

  moonPhase("moon_phase");

  const DailyItem(this.value);
  final String value;

  static List<DailyItem> get defaultItems => DailyItem.values;
}
