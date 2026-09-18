// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityInfo _$CityInfoFromJson(Map<String, dynamic> json) => _CityInfo(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  countryCode: json['country_code'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$CityInfoToJson(_CityInfo instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'country_code': instance.countryCode,
  'location': instance.location,
};
