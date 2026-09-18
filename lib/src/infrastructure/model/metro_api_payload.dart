import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/weather_service.dart';

part 'metro_api_payload.freezed.dart';
part 'metro_api_payload.g.dart';

//TODO: Might change into  simple objects for daily &  hourly items
@freezed
class MetroWeatherPayload extends WeatherRequest with _$MetroWeatherPayload {
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

//TODO: merge with db layer and returns domain string
@JsonEnum(valueField: "value")
enum HourlyItem {
  temperature2m("temperature_2m"),
  relativeHumidity2m("relative_humidity_2m"),
  rain("rain"),
  precipitationProbability("precipitation_probability"),
  uvIndex("uv_index"),
  windSpeed10m("wind_speed_10m");

  const HourlyItem(this.value);
  final String value;

  static List<HourlyItem> get defaultItems => [
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

enum WeatherType {
  clear,
  cloudy,
  fog,
  drizzle,
  freezingDrizzle,
  rain,
  freezingRain,
  snow,
  snowGrains,
  showers,
  snowShowers,
  thunderstorm,
  unknown,

  /// NOTE: WHY  ISAR generate fails with .shorthand
  // Not sure why  the number is exact not range
  ///! https://open-meteo.com/en/docs?timezone=Asia%2FSingapore#weather_variable_documentation
  // static WeatherType fromCode(int code) {
  //   return switch (code) {
  //     < 0 => .unknown,
  //     0 => .clear,
  //     < 4 => .cloudy,
  //     45 || 48 => .fog,
  //     51 || 53 || 55 => .drizzle,
  //     56 || 57 => .freezingDrizzle,
  //     61 || 63 || 65 => .rain,
  //     66 || 67 => .freezingRain,
  //     71 || 73 || 75 => .snow,
  //     77 => .snowGrains,
  //     80 || 81 || 82 => .showers,
  //     85 || 86 => .snowShowers,
  //     95 || 96 || 99 => .thunderstorm,
  //     _ => .unknown,
  //   };
  // }
}
