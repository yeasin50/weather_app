// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityInfoImpl _$$CityInfoImplFromJson(Map<String, dynamic> json) =>
    _$CityInfoImpl(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CityInfoImplToJson(_$CityInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
