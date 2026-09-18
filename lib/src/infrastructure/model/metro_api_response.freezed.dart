// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metro_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetroApiCityInfo {

 int? get id; double get latitude; double get longitude; String get name; String get country; String get countryCode;/// location parts,why  customConverter for simple
 String? get admin1; String? get admin2;
/// Create a copy of MetroApiCityInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetroApiCityInfoCopyWith<MetroApiCityInfo> get copyWith => _$MetroApiCityInfoCopyWithImpl<MetroApiCityInfo>(this as MetroApiCityInfo, _$identity);

  /// Serializes this MetroApiCityInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetroApiCityInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.admin1, admin1) || other.admin1 == admin1)&&(identical(other.admin2, admin2) || other.admin2 == admin2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,name,country,countryCode,admin1,admin2);

@override
String toString() {
  return 'MetroApiCityInfo(id: $id, latitude: $latitude, longitude: $longitude, name: $name, country: $country, countryCode: $countryCode, admin1: $admin1, admin2: $admin2)';
}


}

/// @nodoc
abstract mixin class $MetroApiCityInfoCopyWith<$Res>  {
  factory $MetroApiCityInfoCopyWith(MetroApiCityInfo value, $Res Function(MetroApiCityInfo) _then) = _$MetroApiCityInfoCopyWithImpl;
@useResult
$Res call({
 int? id, double latitude, double longitude, String name, String country, String countryCode, String? admin1, String? admin2
});




}
/// @nodoc
class _$MetroApiCityInfoCopyWithImpl<$Res>
    implements $MetroApiCityInfoCopyWith<$Res> {
  _$MetroApiCityInfoCopyWithImpl(this._self, this._then);

  final MetroApiCityInfo _self;
  final $Res Function(MetroApiCityInfo) _then;

/// Create a copy of MetroApiCityInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? latitude = null,Object? longitude = null,Object? name = null,Object? country = null,Object? countryCode = null,Object? admin1 = freezed,Object? admin2 = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,admin1: freezed == admin1 ? _self.admin1 : admin1 // ignore: cast_nullable_to_non_nullable
as String?,admin2: freezed == admin2 ? _self.admin2 : admin2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetroApiCityInfo].
extension MetroApiCityInfoPatterns on MetroApiCityInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetroApiCityInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetroApiCityInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetroApiCityInfo value)  $default,){
final _that = this;
switch (_that) {
case _MetroApiCityInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetroApiCityInfo value)?  $default,){
final _that = this;
switch (_that) {
case _MetroApiCityInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  double latitude,  double longitude,  String name,  String country,  String countryCode,  String? admin1,  String? admin2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetroApiCityInfo() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.name,_that.country,_that.countryCode,_that.admin1,_that.admin2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  double latitude,  double longitude,  String name,  String country,  String countryCode,  String? admin1,  String? admin2)  $default,) {final _that = this;
switch (_that) {
case _MetroApiCityInfo():
return $default(_that.id,_that.latitude,_that.longitude,_that.name,_that.country,_that.countryCode,_that.admin1,_that.admin2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  double latitude,  double longitude,  String name,  String country,  String countryCode,  String? admin1,  String? admin2)?  $default,) {final _that = this;
switch (_that) {
case _MetroApiCityInfo() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.name,_that.country,_that.countryCode,_that.admin1,_that.admin2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetroApiCityInfo extends MetroApiCityInfo {
  const _MetroApiCityInfo({this.id, required this.latitude, required this.longitude, required this.name, required this.country, required this.countryCode, this.admin1, this.admin2}): super._();
  factory _MetroApiCityInfo.fromJson(Map<String, dynamic> json) => _$MetroApiCityInfoFromJson(json);

@override final  int? id;
@override final  double latitude;
@override final  double longitude;
@override final  String name;
@override final  String country;
@override final  String countryCode;
/// location parts,why  customConverter for simple
@override final  String? admin1;
@override final  String? admin2;

/// Create a copy of MetroApiCityInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetroApiCityInfoCopyWith<_MetroApiCityInfo> get copyWith => __$MetroApiCityInfoCopyWithImpl<_MetroApiCityInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetroApiCityInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetroApiCityInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.admin1, admin1) || other.admin1 == admin1)&&(identical(other.admin2, admin2) || other.admin2 == admin2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,name,country,countryCode,admin1,admin2);

@override
String toString() {
  return 'MetroApiCityInfo(id: $id, latitude: $latitude, longitude: $longitude, name: $name, country: $country, countryCode: $countryCode, admin1: $admin1, admin2: $admin2)';
}


}

/// @nodoc
abstract mixin class _$MetroApiCityInfoCopyWith<$Res> implements $MetroApiCityInfoCopyWith<$Res> {
  factory _$MetroApiCityInfoCopyWith(_MetroApiCityInfo value, $Res Function(_MetroApiCityInfo) _then) = __$MetroApiCityInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, double latitude, double longitude, String name, String country, String countryCode, String? admin1, String? admin2
});




}
/// @nodoc
class __$MetroApiCityInfoCopyWithImpl<$Res>
    implements _$MetroApiCityInfoCopyWith<$Res> {
  __$MetroApiCityInfoCopyWithImpl(this._self, this._then);

  final _MetroApiCityInfo _self;
  final $Res Function(_MetroApiCityInfo) _then;

/// Create a copy of MetroApiCityInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? latitude = null,Object? longitude = null,Object? name = null,Object? country = null,Object? countryCode = null,Object? admin1 = freezed,Object? admin2 = freezed,}) {
  return _then(_MetroApiCityInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,admin1: freezed == admin1 ? _self.admin1 : admin1 // ignore: cast_nullable_to_non_nullable
as String?,admin2: freezed == admin2 ? _self.admin2 : admin2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MetroApiResponse {

 double get latitude; double get longitude; String get timezone; Map<String, String> get hourlyUnits; Map<String, List<dynamic>> get hourly; Map<String, String> get dailyUnits; Map<String, List<dynamic>> get daily;
/// Create a copy of MetroApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetroApiResponseCopyWith<MetroApiResponse> get copyWith => _$MetroApiResponseCopyWithImpl<MetroApiResponse>(this as MetroApiResponse, _$identity);

  /// Serializes this MetroApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetroApiResponse&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&const DeepCollectionEquality().equals(other.hourlyUnits, hourlyUnits)&&const DeepCollectionEquality().equals(other.hourly, hourly)&&const DeepCollectionEquality().equals(other.dailyUnits, dailyUnits)&&const DeepCollectionEquality().equals(other.daily, daily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,timezone,const DeepCollectionEquality().hash(hourlyUnits),const DeepCollectionEquality().hash(hourly),const DeepCollectionEquality().hash(dailyUnits),const DeepCollectionEquality().hash(daily));

@override
String toString() {
  return 'MetroApiResponse(latitude: $latitude, longitude: $longitude, timezone: $timezone, hourlyUnits: $hourlyUnits, hourly: $hourly, dailyUnits: $dailyUnits, daily: $daily)';
}


}

/// @nodoc
abstract mixin class $MetroApiResponseCopyWith<$Res>  {
  factory $MetroApiResponseCopyWith(MetroApiResponse value, $Res Function(MetroApiResponse) _then) = _$MetroApiResponseCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String timezone, Map<String, String> hourlyUnits, Map<String, List<dynamic>> hourly, Map<String, String> dailyUnits, Map<String, List<dynamic>> daily
});




}
/// @nodoc
class _$MetroApiResponseCopyWithImpl<$Res>
    implements $MetroApiResponseCopyWith<$Res> {
  _$MetroApiResponseCopyWithImpl(this._self, this._then);

  final MetroApiResponse _self;
  final $Res Function(MetroApiResponse) _then;

/// Create a copy of MetroApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? timezone = null,Object? hourlyUnits = null,Object? hourly = null,Object? dailyUnits = null,Object? daily = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,hourlyUnits: null == hourlyUnits ? _self.hourlyUnits : hourlyUnits // ignore: cast_nullable_to_non_nullable
as Map<String, String>,hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as Map<String, List<dynamic>>,dailyUnits: null == dailyUnits ? _self.dailyUnits : dailyUnits // ignore: cast_nullable_to_non_nullable
as Map<String, String>,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as Map<String, List<dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetroApiResponse].
extension MetroApiResponsePatterns on MetroApiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetroApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetroApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetroApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _MetroApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetroApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MetroApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String timezone,  Map<String, String> hourlyUnits,  Map<String, List<dynamic>> hourly,  Map<String, String> dailyUnits,  Map<String, List<dynamic>> daily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetroApiResponse() when $default != null:
return $default(_that.latitude,_that.longitude,_that.timezone,_that.hourlyUnits,_that.hourly,_that.dailyUnits,_that.daily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String timezone,  Map<String, String> hourlyUnits,  Map<String, List<dynamic>> hourly,  Map<String, String> dailyUnits,  Map<String, List<dynamic>> daily)  $default,) {final _that = this;
switch (_that) {
case _MetroApiResponse():
return $default(_that.latitude,_that.longitude,_that.timezone,_that.hourlyUnits,_that.hourly,_that.dailyUnits,_that.daily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  String timezone,  Map<String, String> hourlyUnits,  Map<String, List<dynamic>> hourly,  Map<String, String> dailyUnits,  Map<String, List<dynamic>> daily)?  $default,) {final _that = this;
switch (_that) {
case _MetroApiResponse() when $default != null:
return $default(_that.latitude,_that.longitude,_that.timezone,_that.hourlyUnits,_that.hourly,_that.dailyUnits,_that.daily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetroApiResponse extends MetroApiResponse {
  const _MetroApiResponse({required this.latitude, required this.longitude, required this.timezone, required final  Map<String, String> hourlyUnits, required final  Map<String, List<dynamic>> hourly, required final  Map<String, String> dailyUnits, required final  Map<String, List<dynamic>> daily}): _hourlyUnits = hourlyUnits,_hourly = hourly,_dailyUnits = dailyUnits,_daily = daily,super._();
  factory _MetroApiResponse.fromJson(Map<String, dynamic> json) => _$MetroApiResponseFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  String timezone;
 final  Map<String, String> _hourlyUnits;
@override Map<String, String> get hourlyUnits {
  if (_hourlyUnits is EqualUnmodifiableMapView) return _hourlyUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hourlyUnits);
}

 final  Map<String, List<dynamic>> _hourly;
@override Map<String, List<dynamic>> get hourly {
  if (_hourly is EqualUnmodifiableMapView) return _hourly;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hourly);
}

 final  Map<String, String> _dailyUnits;
@override Map<String, String> get dailyUnits {
  if (_dailyUnits is EqualUnmodifiableMapView) return _dailyUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_dailyUnits);
}

 final  Map<String, List<dynamic>> _daily;
@override Map<String, List<dynamic>> get daily {
  if (_daily is EqualUnmodifiableMapView) return _daily;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_daily);
}


/// Create a copy of MetroApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetroApiResponseCopyWith<_MetroApiResponse> get copyWith => __$MetroApiResponseCopyWithImpl<_MetroApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetroApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetroApiResponse&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&const DeepCollectionEquality().equals(other._hourlyUnits, _hourlyUnits)&&const DeepCollectionEquality().equals(other._hourly, _hourly)&&const DeepCollectionEquality().equals(other._dailyUnits, _dailyUnits)&&const DeepCollectionEquality().equals(other._daily, _daily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,timezone,const DeepCollectionEquality().hash(_hourlyUnits),const DeepCollectionEquality().hash(_hourly),const DeepCollectionEquality().hash(_dailyUnits),const DeepCollectionEquality().hash(_daily));

@override
String toString() {
  return 'MetroApiResponse(latitude: $latitude, longitude: $longitude, timezone: $timezone, hourlyUnits: $hourlyUnits, hourly: $hourly, dailyUnits: $dailyUnits, daily: $daily)';
}


}

/// @nodoc
abstract mixin class _$MetroApiResponseCopyWith<$Res> implements $MetroApiResponseCopyWith<$Res> {
  factory _$MetroApiResponseCopyWith(_MetroApiResponse value, $Res Function(_MetroApiResponse) _then) = __$MetroApiResponseCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, String timezone, Map<String, String> hourlyUnits, Map<String, List<dynamic>> hourly, Map<String, String> dailyUnits, Map<String, List<dynamic>> daily
});




}
/// @nodoc
class __$MetroApiResponseCopyWithImpl<$Res>
    implements _$MetroApiResponseCopyWith<$Res> {
  __$MetroApiResponseCopyWithImpl(this._self, this._then);

  final _MetroApiResponse _self;
  final $Res Function(_MetroApiResponse) _then;

/// Create a copy of MetroApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? timezone = null,Object? hourlyUnits = null,Object? hourly = null,Object? dailyUnits = null,Object? daily = null,}) {
  return _then(_MetroApiResponse(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,hourlyUnits: null == hourlyUnits ? _self._hourlyUnits : hourlyUnits // ignore: cast_nullable_to_non_nullable
as Map<String, String>,hourly: null == hourly ? _self._hourly : hourly // ignore: cast_nullable_to_non_nullable
as Map<String, List<dynamic>>,dailyUnits: null == dailyUnits ? _self._dailyUnits : dailyUnits // ignore: cast_nullable_to_non_nullable
as Map<String, String>,daily: null == daily ? _self._daily : daily // ignore: cast_nullable_to_non_nullable
as Map<String, List<dynamic>>,
  ));
}


}

// dart format on
