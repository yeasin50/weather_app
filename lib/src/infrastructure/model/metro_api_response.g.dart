// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metro_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetroApiCityInfoImpl _$$MetroApiCityInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$MetroApiCityInfoImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String,
      country: json['country'] as String,
      countryCode: json['country_code'] as String,
    );

Map<String, dynamic> _$$MetroApiCityInfoImplToJson(
        _$MetroApiCityInfoImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'country': instance.country,
      'country_code': instance.countryCode,
    };

_$MetroApiResponseImpl _$$MetroApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MetroApiResponseImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timezone: json['timezone'] as String,
      hourlyUnits: Map<String, String>.from(json['hourly_units'] as Map),
      hourly: (json['hourly'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as List<dynamic>),
      ),
      dailyUnits: Map<String, String>.from(json['daily_units'] as Map),
      daily: (json['daily'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as List<dynamic>),
      ),
    );

Map<String, dynamic> _$$MetroApiResponseImplToJson(
        _$MetroApiResponseImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
      'daily_units': instance.dailyUnits,
      'daily': instance.daily,
    };
