// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metro_api_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetroWeatherPayloadImpl _$$MetroWeatherPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$MetroWeatherPayloadImpl(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  hourlyItems: (json['hourly_items'] as List<dynamic>)
      .map((e) => $enumDecode(_$HourlyItemEnumMap, e))
      .toList(),
  dailyItems: (json['daily_items'] as List<dynamic>)
      .map((e) => $enumDecode(_$DailyItemEnumMap, e))
      .toList(),
  timezone: json['timezone'] as String? ?? "auto",
  pastDays: (json['past_days'] as num?)?.toInt() ?? 7,
);

Map<String, dynamic> _$$MetroWeatherPayloadImplToJson(
  _$MetroWeatherPayloadImpl instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'hourly_items': instance.hourlyItems
      .map((e) => _$HourlyItemEnumMap[e]!)
      .toList(),
  'daily_items': instance.dailyItems
      .map((e) => _$DailyItemEnumMap[e]!)
      .toList(),
  'timezone': instance.timezone,
  'past_days': instance.pastDays,
};

const _$HourlyItemEnumMap = {
  HourlyItem.temperature2m: 'temperature_2m',
  HourlyItem.relativeHumidity2m: 'relative_humidity_2m',
  HourlyItem.rain: 'rain',
  HourlyItem.precipitationProbability: 'precipitation_probability',
  HourlyItem.uvIndex: 'uv_index',
  HourlyItem.windSpeed10m: 'wind_speed_10m',
};

const _$DailyItemEnumMap = {
  DailyItem.sunrise: 'sunrise',
  DailyItem.sunset: 'sunset',
  DailyItem.moonPhase: 'moon_phase',
  DailyItem.temperatureMax: 'temperature_2m_max',
  DailyItem.temperatureMin: 'temperature_2m_min',
};
