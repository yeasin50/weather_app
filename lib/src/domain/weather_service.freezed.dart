// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityInfo {

 int? get id; String get name; double get latitude; double get longitude; String get countryCode; String get location;
/// Create a copy of CityInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityInfoCopyWith<CityInfo> get copyWith => _$CityInfoCopyWithImpl<CityInfo>(this as CityInfo, _$identity);

  /// Serializes this CityInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,latitude,longitude,countryCode,location);

@override
String toString() {
  return 'CityInfo(id: $id, name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, location: $location)';
}


}

/// @nodoc
abstract mixin class $CityInfoCopyWith<$Res>  {
  factory $CityInfoCopyWith(CityInfo value, $Res Function(CityInfo) _then) = _$CityInfoCopyWithImpl;
@useResult
$Res call({
 int? id, String name, double latitude, double longitude, String countryCode, String location
});




}
/// @nodoc
class _$CityInfoCopyWithImpl<$Res>
    implements $CityInfoCopyWith<$Res> {
  _$CityInfoCopyWithImpl(this._self, this._then);

  final CityInfo _self;
  final $Res Function(CityInfo) _then;

/// Create a copy of CityInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? latitude = null,Object? longitude = null,Object? countryCode = null,Object? location = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CityInfo].
extension CityInfoPatterns on CityInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityInfo value)  $default,){
final _that = this;
switch (_that) {
case _CityInfo():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CityInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  double latitude,  double longitude,  String countryCode,  String location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityInfo() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.countryCode,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  double latitude,  double longitude,  String countryCode,  String location)  $default,) {final _that = this;
switch (_that) {
case _CityInfo():
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.countryCode,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  double latitude,  double longitude,  String countryCode,  String location)?  $default,) {final _that = this;
switch (_that) {
case _CityInfo() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.countryCode,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityInfo implements CityInfo {
  const _CityInfo({this.id, required this.name, required this.latitude, required this.longitude, required this.countryCode, required this.location});
  factory _CityInfo.fromJson(Map<String, dynamic> json) => _$CityInfoFromJson(json);

@override final  int? id;
@override final  String name;
@override final  double latitude;
@override final  double longitude;
@override final  String countryCode;
@override final  String location;

/// Create a copy of CityInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityInfoCopyWith<_CityInfo> get copyWith => __$CityInfoCopyWithImpl<_CityInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,latitude,longitude,countryCode,location);

@override
String toString() {
  return 'CityInfo(id: $id, name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CityInfoCopyWith<$Res> implements $CityInfoCopyWith<$Res> {
  factory _$CityInfoCopyWith(_CityInfo value, $Res Function(_CityInfo) _then) = __$CityInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, double latitude, double longitude, String countryCode, String location
});




}
/// @nodoc
class __$CityInfoCopyWithImpl<$Res>
    implements _$CityInfoCopyWith<$Res> {
  __$CityInfoCopyWithImpl(this._self, this._then);

  final _CityInfo _self;
  final $Res Function(_CityInfo) _then;

/// Create a copy of CityInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? latitude = null,Object? longitude = null,Object? countryCode = null,Object? location = null,}) {
  return _then(_CityInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$WeatherResponse {

 CityInfo get city; List<WeatherMeasurement> get dailyRecords; List<WeatherMeasurement> get hourlyRecord;
/// Create a copy of WeatherResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherResponseCopyWith<WeatherResponse> get copyWith => _$WeatherResponseCopyWithImpl<WeatherResponse>(this as WeatherResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherResponse&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.dailyRecords, dailyRecords)&&const DeepCollectionEquality().equals(other.hourlyRecord, hourlyRecord));
}


@override
int get hashCode => Object.hash(runtimeType,city,const DeepCollectionEquality().hash(dailyRecords),const DeepCollectionEquality().hash(hourlyRecord));

@override
String toString() {
  return 'WeatherResponse(city: $city, dailyRecords: $dailyRecords, hourlyRecord: $hourlyRecord)';
}


}

/// @nodoc
abstract mixin class $WeatherResponseCopyWith<$Res>  {
  factory $WeatherResponseCopyWith(WeatherResponse value, $Res Function(WeatherResponse) _then) = _$WeatherResponseCopyWithImpl;
@useResult
$Res call({
 CityInfo city, List<WeatherMeasurement> dailyRecords, List<WeatherMeasurement> hourlyRecord
});


$CityInfoCopyWith<$Res> get city;

}
/// @nodoc
class _$WeatherResponseCopyWithImpl<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._self, this._then);

  final WeatherResponse _self;
  final $Res Function(WeatherResponse) _then;

/// Create a copy of WeatherResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? dailyRecords = null,Object? hourlyRecord = null,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityInfo,dailyRecords: null == dailyRecords ? _self.dailyRecords : dailyRecords // ignore: cast_nullable_to_non_nullable
as List<WeatherMeasurement>,hourlyRecord: null == hourlyRecord ? _self.hourlyRecord : hourlyRecord // ignore: cast_nullable_to_non_nullable
as List<WeatherMeasurement>,
  ));
}
/// Create a copy of WeatherResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityInfoCopyWith<$Res> get city {
  
  return $CityInfoCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherResponse].
extension WeatherResponsePatterns on WeatherResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherResponse value)  $default,){
final _that = this;
switch (_that) {
case _WeatherResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CityInfo city,  List<WeatherMeasurement> dailyRecords,  List<WeatherMeasurement> hourlyRecord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherResponse() when $default != null:
return $default(_that.city,_that.dailyRecords,_that.hourlyRecord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CityInfo city,  List<WeatherMeasurement> dailyRecords,  List<WeatherMeasurement> hourlyRecord)  $default,) {final _that = this;
switch (_that) {
case _WeatherResponse():
return $default(_that.city,_that.dailyRecords,_that.hourlyRecord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CityInfo city,  List<WeatherMeasurement> dailyRecords,  List<WeatherMeasurement> hourlyRecord)?  $default,) {final _that = this;
switch (_that) {
case _WeatherResponse() when $default != null:
return $default(_that.city,_that.dailyRecords,_that.hourlyRecord);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherResponse implements WeatherResponse {
  const _WeatherResponse({required this.city, required final  List<WeatherMeasurement> dailyRecords, required final  List<WeatherMeasurement> hourlyRecord}): _dailyRecords = dailyRecords,_hourlyRecord = hourlyRecord;
  

@override final  CityInfo city;
 final  List<WeatherMeasurement> _dailyRecords;
@override List<WeatherMeasurement> get dailyRecords {
  if (_dailyRecords is EqualUnmodifiableListView) return _dailyRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyRecords);
}

 final  List<WeatherMeasurement> _hourlyRecord;
@override List<WeatherMeasurement> get hourlyRecord {
  if (_hourlyRecord is EqualUnmodifiableListView) return _hourlyRecord;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyRecord);
}


/// Create a copy of WeatherResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherResponseCopyWith<_WeatherResponse> get copyWith => __$WeatherResponseCopyWithImpl<_WeatherResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherResponse&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other._dailyRecords, _dailyRecords)&&const DeepCollectionEquality().equals(other._hourlyRecord, _hourlyRecord));
}


@override
int get hashCode => Object.hash(runtimeType,city,const DeepCollectionEquality().hash(_dailyRecords),const DeepCollectionEquality().hash(_hourlyRecord));

@override
String toString() {
  return 'WeatherResponse(city: $city, dailyRecords: $dailyRecords, hourlyRecord: $hourlyRecord)';
}


}

/// @nodoc
abstract mixin class _$WeatherResponseCopyWith<$Res> implements $WeatherResponseCopyWith<$Res> {
  factory _$WeatherResponseCopyWith(_WeatherResponse value, $Res Function(_WeatherResponse) _then) = __$WeatherResponseCopyWithImpl;
@override @useResult
$Res call({
 CityInfo city, List<WeatherMeasurement> dailyRecords, List<WeatherMeasurement> hourlyRecord
});


@override $CityInfoCopyWith<$Res> get city;

}
/// @nodoc
class __$WeatherResponseCopyWithImpl<$Res>
    implements _$WeatherResponseCopyWith<$Res> {
  __$WeatherResponseCopyWithImpl(this._self, this._then);

  final _WeatherResponse _self;
  final $Res Function(_WeatherResponse) _then;

/// Create a copy of WeatherResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? dailyRecords = null,Object? hourlyRecord = null,}) {
  return _then(_WeatherResponse(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityInfo,dailyRecords: null == dailyRecords ? _self._dailyRecords : dailyRecords // ignore: cast_nullable_to_non_nullable
as List<WeatherMeasurement>,hourlyRecord: null == hourlyRecord ? _self._hourlyRecord : hourlyRecord // ignore: cast_nullable_to_non_nullable
as List<WeatherMeasurement>,
  ));
}

/// Create a copy of WeatherResponse
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
