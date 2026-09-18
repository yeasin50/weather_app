// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metro_api_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetroWeatherPayload {

 CityInfo get city;@deprecated double get latitude;@deprecated double get longitude; List<HourlyItem> get hourlyItems; List<DailyItem> get dailyItems; String get timezone; int get pastDays;
/// Create a copy of MetroWeatherPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetroWeatherPayloadCopyWith<MetroWeatherPayload> get copyWith => _$MetroWeatherPayloadCopyWithImpl<MetroWeatherPayload>(this as MetroWeatherPayload, _$identity);

  /// Serializes this MetroWeatherPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetroWeatherPayload&&(identical(other.city, city) || other.city == city)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.hourlyItems, hourlyItems)&&const DeepCollectionEquality().equals(other.dailyItems, dailyItems)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.pastDays, pastDays) || other.pastDays == pastDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,latitude,longitude,const DeepCollectionEquality().hash(hourlyItems),const DeepCollectionEquality().hash(dailyItems),timezone,pastDays);

@override
String toString() {
  return 'MetroWeatherPayload(city: $city, latitude: $latitude, longitude: $longitude, hourlyItems: $hourlyItems, dailyItems: $dailyItems, timezone: $timezone, pastDays: $pastDays)';
}


}

/// @nodoc
abstract mixin class $MetroWeatherPayloadCopyWith<$Res>  {
  factory $MetroWeatherPayloadCopyWith(MetroWeatherPayload value, $Res Function(MetroWeatherPayload) _then) = _$MetroWeatherPayloadCopyWithImpl;
@useResult
$Res call({
 CityInfo city,@deprecated double latitude,@deprecated double longitude, List<HourlyItem> hourlyItems, List<DailyItem> dailyItems, String timezone, int pastDays
});


$CityInfoCopyWith<$Res> get city;

}
/// @nodoc
class _$MetroWeatherPayloadCopyWithImpl<$Res>
    implements $MetroWeatherPayloadCopyWith<$Res> {
  _$MetroWeatherPayloadCopyWithImpl(this._self, this._then);

  final MetroWeatherPayload _self;
  final $Res Function(MetroWeatherPayload) _then;

/// Create a copy of MetroWeatherPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? latitude = null,Object? longitude = null,Object? hourlyItems = null,Object? dailyItems = null,Object? timezone = null,Object? pastDays = null,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityInfo,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,hourlyItems: null == hourlyItems ? _self.hourlyItems : hourlyItems // ignore: cast_nullable_to_non_nullable
as List<HourlyItem>,dailyItems: null == dailyItems ? _self.dailyItems : dailyItems // ignore: cast_nullable_to_non_nullable
as List<DailyItem>,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,pastDays: null == pastDays ? _self.pastDays : pastDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MetroWeatherPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityInfoCopyWith<$Res> get city {
  
  return $CityInfoCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetroWeatherPayload].
extension MetroWeatherPayloadPatterns on MetroWeatherPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetroWeatherPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetroWeatherPayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetroWeatherPayload value)  $default,){
final _that = this;
switch (_that) {
case _MetroWeatherPayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetroWeatherPayload value)?  $default,){
final _that = this;
switch (_that) {
case _MetroWeatherPayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CityInfo city, @deprecated  double latitude, @deprecated  double longitude,  List<HourlyItem> hourlyItems,  List<DailyItem> dailyItems,  String timezone,  int pastDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetroWeatherPayload() when $default != null:
return $default(_that.city,_that.latitude,_that.longitude,_that.hourlyItems,_that.dailyItems,_that.timezone,_that.pastDays);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CityInfo city, @deprecated  double latitude, @deprecated  double longitude,  List<HourlyItem> hourlyItems,  List<DailyItem> dailyItems,  String timezone,  int pastDays)  $default,) {final _that = this;
switch (_that) {
case _MetroWeatherPayload():
return $default(_that.city,_that.latitude,_that.longitude,_that.hourlyItems,_that.dailyItems,_that.timezone,_that.pastDays);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CityInfo city, @deprecated  double latitude, @deprecated  double longitude,  List<HourlyItem> hourlyItems,  List<DailyItem> dailyItems,  String timezone,  int pastDays)?  $default,) {final _that = this;
switch (_that) {
case _MetroWeatherPayload() when $default != null:
return $default(_that.city,_that.latitude,_that.longitude,_that.hourlyItems,_that.dailyItems,_that.timezone,_that.pastDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetroWeatherPayload extends MetroWeatherPayload {
   _MetroWeatherPayload({required this.city, @deprecated required this.latitude, @deprecated required this.longitude, required final  List<HourlyItem> hourlyItems, required final  List<DailyItem> dailyItems, this.timezone = "auto", this.pastDays = 0}): _hourlyItems = hourlyItems,_dailyItems = dailyItems,super._();
  factory _MetroWeatherPayload.fromJson(Map<String, dynamic> json) => _$MetroWeatherPayloadFromJson(json);

@override final  CityInfo city;
@override@deprecated final  double latitude;
@override@deprecated final  double longitude;
 final  List<HourlyItem> _hourlyItems;
@override List<HourlyItem> get hourlyItems {
  if (_hourlyItems is EqualUnmodifiableListView) return _hourlyItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyItems);
}

 final  List<DailyItem> _dailyItems;
@override List<DailyItem> get dailyItems {
  if (_dailyItems is EqualUnmodifiableListView) return _dailyItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyItems);
}

@override@JsonKey() final  String timezone;
@override@JsonKey() final  int pastDays;

/// Create a copy of MetroWeatherPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetroWeatherPayloadCopyWith<_MetroWeatherPayload> get copyWith => __$MetroWeatherPayloadCopyWithImpl<_MetroWeatherPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetroWeatherPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetroWeatherPayload&&(identical(other.city, city) || other.city == city)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._hourlyItems, _hourlyItems)&&const DeepCollectionEquality().equals(other._dailyItems, _dailyItems)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.pastDays, pastDays) || other.pastDays == pastDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,latitude,longitude,const DeepCollectionEquality().hash(_hourlyItems),const DeepCollectionEquality().hash(_dailyItems),timezone,pastDays);

@override
String toString() {
  return 'MetroWeatherPayload(city: $city, latitude: $latitude, longitude: $longitude, hourlyItems: $hourlyItems, dailyItems: $dailyItems, timezone: $timezone, pastDays: $pastDays)';
}


}

/// @nodoc
abstract mixin class _$MetroWeatherPayloadCopyWith<$Res> implements $MetroWeatherPayloadCopyWith<$Res> {
  factory _$MetroWeatherPayloadCopyWith(_MetroWeatherPayload value, $Res Function(_MetroWeatherPayload) _then) = __$MetroWeatherPayloadCopyWithImpl;
@override @useResult
$Res call({
 CityInfo city,@deprecated double latitude,@deprecated double longitude, List<HourlyItem> hourlyItems, List<DailyItem> dailyItems, String timezone, int pastDays
});


@override $CityInfoCopyWith<$Res> get city;

}
/// @nodoc
class __$MetroWeatherPayloadCopyWithImpl<$Res>
    implements _$MetroWeatherPayloadCopyWith<$Res> {
  __$MetroWeatherPayloadCopyWithImpl(this._self, this._then);

  final _MetroWeatherPayload _self;
  final $Res Function(_MetroWeatherPayload) _then;

/// Create a copy of MetroWeatherPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? latitude = null,Object? longitude = null,Object? hourlyItems = null,Object? dailyItems = null,Object? timezone = null,Object? pastDays = null,}) {
  return _then(_MetroWeatherPayload(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityInfo,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,hourlyItems: null == hourlyItems ? _self._hourlyItems : hourlyItems // ignore: cast_nullable_to_non_nullable
as List<HourlyItem>,dailyItems: null == dailyItems ? _self._dailyItems : dailyItems // ignore: cast_nullable_to_non_nullable
as List<DailyItem>,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,pastDays: null == pastDays ? _self.pastDays : pastDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MetroWeatherPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityInfoCopyWith<$Res> get city {
  
  return $CityInfoCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

// dart format on
