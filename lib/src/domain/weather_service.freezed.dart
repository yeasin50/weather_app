// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CityInfo _$CityInfoFromJson(Map<String, dynamic> json) {
  return _CityInfo.fromJson(json);
}

/// @nodoc
mixin _$CityInfo {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// Serializes this CityInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityInfoCopyWith<CityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityInfoCopyWith<$Res> {
  factory $CityInfoCopyWith(CityInfo value, $Res Function(CityInfo) then) =
      _$CityInfoCopyWithImpl<$Res, CityInfo>;
  @useResult
  $Res call({
    int? id,
    String name,
    double latitude,
    double longitude,
    String countryCode,
    String location,
  });
}

/// @nodoc
class _$CityInfoCopyWithImpl<$Res, $Val extends CityInfo>
    implements $CityInfoCopyWith<$Res> {
  _$CityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? countryCode = null,
    Object? location = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            countryCode: null == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CityInfoImplCopyWith<$Res>
    implements $CityInfoCopyWith<$Res> {
  factory _$$CityInfoImplCopyWith(
    _$CityInfoImpl value,
    $Res Function(_$CityInfoImpl) then,
  ) = __$$CityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String name,
    double latitude,
    double longitude,
    String countryCode,
    String location,
  });
}

/// @nodoc
class __$$CityInfoImplCopyWithImpl<$Res>
    extends _$CityInfoCopyWithImpl<$Res, _$CityInfoImpl>
    implements _$$CityInfoImplCopyWith<$Res> {
  __$$CityInfoImplCopyWithImpl(
    _$CityInfoImpl _value,
    $Res Function(_$CityInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? countryCode = null,
    Object? location = null,
  }) {
    return _then(
      _$CityInfoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        countryCode: null == countryCode
            ? _value.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CityInfoImpl implements _CityInfo {
  const _$CityInfoImpl({
    this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.countryCode,
    required this.location,
  });

  factory _$CityInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String countryCode;
  @override
  final String location;

  @override
  String toString() {
    return 'CityInfo(id: $id, name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    latitude,
    longitude,
    countryCode,
    location,
  );

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityInfoImplCopyWith<_$CityInfoImpl> get copyWith =>
      __$$CityInfoImplCopyWithImpl<_$CityInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityInfoImplToJson(this);
  }
}

abstract class _CityInfo implements CityInfo {
  const factory _CityInfo({
    final int? id,
    required final String name,
    required final double latitude,
    required final double longitude,
    required final String countryCode,
    required final String location,
  }) = _$CityInfoImpl;

  factory _CityInfo.fromJson(Map<String, dynamic> json) =
      _$CityInfoImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get countryCode;
  @override
  String get location;

  /// Create a copy of CityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityInfoImplCopyWith<_$CityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeatherResponse {
  CityInfo get city => throw _privateConstructorUsedError;
  List<WeatherMeasurement> get dailyRecords =>
      throw _privateConstructorUsedError;
  List<WeatherMeasurement> get hourlyRecord =>
      throw _privateConstructorUsedError;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherResponseCopyWith<WeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseCopyWith<$Res> {
  factory $WeatherResponseCopyWith(
    WeatherResponse value,
    $Res Function(WeatherResponse) then,
  ) = _$WeatherResponseCopyWithImpl<$Res, WeatherResponse>;
  @useResult
  $Res call({
    CityInfo city,
    List<WeatherMeasurement> dailyRecords,
    List<WeatherMeasurement> hourlyRecord,
  });

  $CityInfoCopyWith<$Res> get city;
}

/// @nodoc
class _$WeatherResponseCopyWithImpl<$Res, $Val extends WeatherResponse>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? dailyRecords = null,
    Object? hourlyRecord = null,
  }) {
    return _then(
      _value.copyWith(
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as CityInfo,
            dailyRecords: null == dailyRecords
                ? _value.dailyRecords
                : dailyRecords // ignore: cast_nullable_to_non_nullable
                      as List<WeatherMeasurement>,
            hourlyRecord: null == hourlyRecord
                ? _value.hourlyRecord
                : hourlyRecord // ignore: cast_nullable_to_non_nullable
                      as List<WeatherMeasurement>,
          )
          as $Val,
    );
  }

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityInfoCopyWith<$Res> get city {
    return $CityInfoCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherResponseImplCopyWith<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  factory _$$WeatherResponseImplCopyWith(
    _$WeatherResponseImpl value,
    $Res Function(_$WeatherResponseImpl) then,
  ) = __$$WeatherResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CityInfo city,
    List<WeatherMeasurement> dailyRecords,
    List<WeatherMeasurement> hourlyRecord,
  });

  @override
  $CityInfoCopyWith<$Res> get city;
}

/// @nodoc
class __$$WeatherResponseImplCopyWithImpl<$Res>
    extends _$WeatherResponseCopyWithImpl<$Res, _$WeatherResponseImpl>
    implements _$$WeatherResponseImplCopyWith<$Res> {
  __$$WeatherResponseImplCopyWithImpl(
    _$WeatherResponseImpl _value,
    $Res Function(_$WeatherResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? dailyRecords = null,
    Object? hourlyRecord = null,
  }) {
    return _then(
      _$WeatherResponseImpl(
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as CityInfo,
        dailyRecords: null == dailyRecords
            ? _value._dailyRecords
            : dailyRecords // ignore: cast_nullable_to_non_nullable
                  as List<WeatherMeasurement>,
        hourlyRecord: null == hourlyRecord
            ? _value._hourlyRecord
            : hourlyRecord // ignore: cast_nullable_to_non_nullable
                  as List<WeatherMeasurement>,
      ),
    );
  }
}

/// @nodoc

class _$WeatherResponseImpl implements _WeatherResponse {
  const _$WeatherResponseImpl({
    required this.city,
    required final List<WeatherMeasurement> dailyRecords,
    required final List<WeatherMeasurement> hourlyRecord,
  }) : _dailyRecords = dailyRecords,
       _hourlyRecord = hourlyRecord;

  @override
  final CityInfo city;
  final List<WeatherMeasurement> _dailyRecords;
  @override
  List<WeatherMeasurement> get dailyRecords {
    if (_dailyRecords is EqualUnmodifiableListView) return _dailyRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyRecords);
  }

  final List<WeatherMeasurement> _hourlyRecord;
  @override
  List<WeatherMeasurement> get hourlyRecord {
    if (_hourlyRecord is EqualUnmodifiableListView) return _hourlyRecord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyRecord);
  }

  @override
  String toString() {
    return 'WeatherResponse(city: $city, dailyRecords: $dailyRecords, hourlyRecord: $hourlyRecord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherResponseImpl &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(
              other._dailyRecords,
              _dailyRecords,
            ) &&
            const DeepCollectionEquality().equals(
              other._hourlyRecord,
              _hourlyRecord,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    city,
    const DeepCollectionEquality().hash(_dailyRecords),
    const DeepCollectionEquality().hash(_hourlyRecord),
  );

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherResponseImplCopyWith<_$WeatherResponseImpl> get copyWith =>
      __$$WeatherResponseImplCopyWithImpl<_$WeatherResponseImpl>(
        this,
        _$identity,
      );
}

abstract class _WeatherResponse implements WeatherResponse {
  const factory _WeatherResponse({
    required final CityInfo city,
    required final List<WeatherMeasurement> dailyRecords,
    required final List<WeatherMeasurement> hourlyRecord,
  }) = _$WeatherResponseImpl;

  @override
  CityInfo get city;
  @override
  List<WeatherMeasurement> get dailyRecords;
  @override
  List<WeatherMeasurement> get hourlyRecord;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherResponseImplCopyWith<_$WeatherResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
