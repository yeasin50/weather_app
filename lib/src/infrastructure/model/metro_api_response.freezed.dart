// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metro_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MetroApiCityInfo _$MetroApiCityInfoFromJson(Map<String, dynamic> json) {
  return _MetroApiCityInfo.fromJson(json);
}

/// @nodoc
mixin _$MetroApiCityInfo {
  int? get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;

  /// location parts,why  customConverter for simple
  String? get admin1 => throw _privateConstructorUsedError;
  String? get admin2 => throw _privateConstructorUsedError;

  /// Serializes this MetroApiCityInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetroApiCityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetroApiCityInfoCopyWith<MetroApiCityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetroApiCityInfoCopyWith<$Res> {
  factory $MetroApiCityInfoCopyWith(
    MetroApiCityInfo value,
    $Res Function(MetroApiCityInfo) then,
  ) = _$MetroApiCityInfoCopyWithImpl<$Res, MetroApiCityInfo>;
  @useResult
  $Res call({
    int? id,
    double latitude,
    double longitude,
    String name,
    String country,
    String countryCode,
    String? admin1,
    String? admin2,
  });
}

/// @nodoc
class _$MetroApiCityInfoCopyWithImpl<$Res, $Val extends MetroApiCityInfo>
    implements $MetroApiCityInfoCopyWith<$Res> {
  _$MetroApiCityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetroApiCityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? country = null,
    Object? countryCode = null,
    Object? admin1 = freezed,
    Object? admin2 = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String,
            countryCode: null == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                      as String,
            admin1: freezed == admin1
                ? _value.admin1
                : admin1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            admin2: freezed == admin2
                ? _value.admin2
                : admin2 // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetroApiCityInfoImplCopyWith<$Res>
    implements $MetroApiCityInfoCopyWith<$Res> {
  factory _$$MetroApiCityInfoImplCopyWith(
    _$MetroApiCityInfoImpl value,
    $Res Function(_$MetroApiCityInfoImpl) then,
  ) = __$$MetroApiCityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    double latitude,
    double longitude,
    String name,
    String country,
    String countryCode,
    String? admin1,
    String? admin2,
  });
}

/// @nodoc
class __$$MetroApiCityInfoImplCopyWithImpl<$Res>
    extends _$MetroApiCityInfoCopyWithImpl<$Res, _$MetroApiCityInfoImpl>
    implements _$$MetroApiCityInfoImplCopyWith<$Res> {
  __$$MetroApiCityInfoImplCopyWithImpl(
    _$MetroApiCityInfoImpl _value,
    $Res Function(_$MetroApiCityInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetroApiCityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? country = null,
    Object? countryCode = null,
    Object? admin1 = freezed,
    Object? admin2 = freezed,
  }) {
    return _then(
      _$MetroApiCityInfoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String,
        countryCode: null == countryCode
            ? _value.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String,
        admin1: freezed == admin1
            ? _value.admin1
            : admin1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        admin2: freezed == admin2
            ? _value.admin2
            : admin2 // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetroApiCityInfoImpl extends _MetroApiCityInfo {
  const _$MetroApiCityInfoImpl({
    this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.country,
    required this.countryCode,
    this.admin1,
    this.admin2,
  }) : super._();

  factory _$MetroApiCityInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetroApiCityInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String name;
  @override
  final String country;
  @override
  final String countryCode;

  /// location parts,why  customConverter for simple
  @override
  final String? admin1;
  @override
  final String? admin2;

  @override
  String toString() {
    return 'MetroApiCityInfo(id: $id, latitude: $latitude, longitude: $longitude, name: $name, country: $country, countryCode: $countryCode, admin1: $admin1, admin2: $admin2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetroApiCityInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.admin1, admin1) || other.admin1 == admin1) &&
            (identical(other.admin2, admin2) || other.admin2 == admin2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    latitude,
    longitude,
    name,
    country,
    countryCode,
    admin1,
    admin2,
  );

  /// Create a copy of MetroApiCityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetroApiCityInfoImplCopyWith<_$MetroApiCityInfoImpl> get copyWith =>
      __$$MetroApiCityInfoImplCopyWithImpl<_$MetroApiCityInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MetroApiCityInfoImplToJson(this);
  }
}

abstract class _MetroApiCityInfo extends MetroApiCityInfo {
  const factory _MetroApiCityInfo({
    final int? id,
    required final double latitude,
    required final double longitude,
    required final String name,
    required final String country,
    required final String countryCode,
    final String? admin1,
    final String? admin2,
  }) = _$MetroApiCityInfoImpl;
  const _MetroApiCityInfo._() : super._();

  factory _MetroApiCityInfo.fromJson(Map<String, dynamic> json) =
      _$MetroApiCityInfoImpl.fromJson;

  @override
  int? get id;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get name;
  @override
  String get country;
  @override
  String get countryCode;

  /// location parts,why  customConverter for simple
  @override
  String? get admin1;
  @override
  String? get admin2;

  /// Create a copy of MetroApiCityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetroApiCityInfoImplCopyWith<_$MetroApiCityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetroApiResponse _$MetroApiResponseFromJson(Map<String, dynamic> json) {
  return _MetroApiResponse.fromJson(json);
}

/// @nodoc
mixin _$MetroApiResponse {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  Map<String, String> get hourlyUnits => throw _privateConstructorUsedError;
  Map<String, List<dynamic>>? get hourly => throw _privateConstructorUsedError;
  Map<String, String> get dailyUnits => throw _privateConstructorUsedError;
  Map<String, List<dynamic>>? get daily => throw _privateConstructorUsedError;

  /// Serializes this MetroApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetroApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetroApiResponseCopyWith<MetroApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetroApiResponseCopyWith<$Res> {
  factory $MetroApiResponseCopyWith(
    MetroApiResponse value,
    $Res Function(MetroApiResponse) then,
  ) = _$MetroApiResponseCopyWithImpl<$Res, MetroApiResponse>;
  @useResult
  $Res call({
    double latitude,
    double longitude,
    String timezone,
    Map<String, String> hourlyUnits,
    Map<String, List<dynamic>>? hourly,
    Map<String, String> dailyUnits,
    Map<String, List<dynamic>>? daily,
  });
}

/// @nodoc
class _$MetroApiResponseCopyWithImpl<$Res, $Val extends MetroApiResponse>
    implements $MetroApiResponseCopyWith<$Res> {
  _$MetroApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetroApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timezone = null,
    Object? hourlyUnits = null,
    Object? hourly = freezed,
    Object? dailyUnits = null,
    Object? daily = freezed,
  }) {
    return _then(
      _value.copyWith(
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
            hourlyUnits: null == hourlyUnits
                ? _value.hourlyUnits
                : hourlyUnits // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            hourly: freezed == hourly
                ? _value.hourly
                : hourly // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<dynamic>>?,
            dailyUnits: null == dailyUnits
                ? _value.dailyUnits
                : dailyUnits // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            daily: freezed == daily
                ? _value.daily
                : daily // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<dynamic>>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetroApiResponseImplCopyWith<$Res>
    implements $MetroApiResponseCopyWith<$Res> {
  factory _$$MetroApiResponseImplCopyWith(
    _$MetroApiResponseImpl value,
    $Res Function(_$MetroApiResponseImpl) then,
  ) = __$$MetroApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double latitude,
    double longitude,
    String timezone,
    Map<String, String> hourlyUnits,
    Map<String, List<dynamic>>? hourly,
    Map<String, String> dailyUnits,
    Map<String, List<dynamic>>? daily,
  });
}

/// @nodoc
class __$$MetroApiResponseImplCopyWithImpl<$Res>
    extends _$MetroApiResponseCopyWithImpl<$Res, _$MetroApiResponseImpl>
    implements _$$MetroApiResponseImplCopyWith<$Res> {
  __$$MetroApiResponseImplCopyWithImpl(
    _$MetroApiResponseImpl _value,
    $Res Function(_$MetroApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetroApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timezone = null,
    Object? hourlyUnits = null,
    Object? hourly = freezed,
    Object? dailyUnits = null,
    Object? daily = freezed,
  }) {
    return _then(
      _$MetroApiResponseImpl(
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        hourlyUnits: null == hourlyUnits
            ? _value._hourlyUnits
            : hourlyUnits // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        hourly: freezed == hourly
            ? _value._hourly
            : hourly // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<dynamic>>?,
        dailyUnits: null == dailyUnits
            ? _value._dailyUnits
            : dailyUnits // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        daily: freezed == daily
            ? _value._daily
            : daily // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<dynamic>>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetroApiResponseImpl extends _MetroApiResponse {
  const _$MetroApiResponseImpl({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required final Map<String, String> hourlyUnits,
    required final Map<String, List<dynamic>>? hourly,
    required final Map<String, String> dailyUnits,
    required final Map<String, List<dynamic>>? daily,
  }) : _hourlyUnits = hourlyUnits,
       _hourly = hourly,
       _dailyUnits = dailyUnits,
       _daily = daily,
       super._();

  factory _$MetroApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetroApiResponseImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String timezone;
  final Map<String, String> _hourlyUnits;
  @override
  Map<String, String> get hourlyUnits {
    if (_hourlyUnits is EqualUnmodifiableMapView) return _hourlyUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_hourlyUnits);
  }

  final Map<String, List<dynamic>>? _hourly;
  @override
  Map<String, List<dynamic>>? get hourly {
    final value = _hourly;
    if (value == null) return null;
    if (_hourly is EqualUnmodifiableMapView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, String> _dailyUnits;
  @override
  Map<String, String> get dailyUnits {
    if (_dailyUnits is EqualUnmodifiableMapView) return _dailyUnits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dailyUnits);
  }

  final Map<String, List<dynamic>>? _daily;
  @override
  Map<String, List<dynamic>>? get daily {
    final value = _daily;
    if (value == null) return null;
    if (_daily is EqualUnmodifiableMapView) return _daily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MetroApiResponse(latitude: $latitude, longitude: $longitude, timezone: $timezone, hourlyUnits: $hourlyUnits, hourly: $hourly, dailyUnits: $dailyUnits, daily: $daily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetroApiResponseImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(
              other._hourlyUnits,
              _hourlyUnits,
            ) &&
            const DeepCollectionEquality().equals(other._hourly, _hourly) &&
            const DeepCollectionEquality().equals(
              other._dailyUnits,
              _dailyUnits,
            ) &&
            const DeepCollectionEquality().equals(other._daily, _daily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    latitude,
    longitude,
    timezone,
    const DeepCollectionEquality().hash(_hourlyUnits),
    const DeepCollectionEquality().hash(_hourly),
    const DeepCollectionEquality().hash(_dailyUnits),
    const DeepCollectionEquality().hash(_daily),
  );

  /// Create a copy of MetroApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetroApiResponseImplCopyWith<_$MetroApiResponseImpl> get copyWith =>
      __$$MetroApiResponseImplCopyWithImpl<_$MetroApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MetroApiResponseImplToJson(this);
  }
}

abstract class _MetroApiResponse extends MetroApiResponse {
  const factory _MetroApiResponse({
    required final double latitude,
    required final double longitude,
    required final String timezone,
    required final Map<String, String> hourlyUnits,
    required final Map<String, List<dynamic>>? hourly,
    required final Map<String, String> dailyUnits,
    required final Map<String, List<dynamic>>? daily,
  }) = _$MetroApiResponseImpl;
  const _MetroApiResponse._() : super._();

  factory _MetroApiResponse.fromJson(Map<String, dynamic> json) =
      _$MetroApiResponseImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get timezone;
  @override
  Map<String, String> get hourlyUnits;
  @override
  Map<String, List<dynamic>>? get hourly;
  @override
  Map<String, String> get dailyUnits;
  @override
  Map<String, List<dynamic>>? get daily;

  /// Create a copy of MetroApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetroApiResponseImplCopyWith<_$MetroApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
