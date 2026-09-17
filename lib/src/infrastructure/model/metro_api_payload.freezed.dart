// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metro_api_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MetroWeatherPayload _$MetroWeatherPayloadFromJson(Map<String, dynamic> json) {
  return _MetroWeatherPayload.fromJson(json);
}

/// @nodoc
mixin _$MetroWeatherPayload {
  CityInfo get city => throw _privateConstructorUsedError;
  @deprecated
  double get latitude => throw _privateConstructorUsedError;
  @deprecated
  double get longitude => throw _privateConstructorUsedError;
  List<HourlyItem> get hourlyItems => throw _privateConstructorUsedError;
  List<DailyItem> get dailyItems => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  int get pastDays => throw _privateConstructorUsedError;

  /// Serializes this MetroWeatherPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetroWeatherPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetroWeatherPayloadCopyWith<MetroWeatherPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetroWeatherPayloadCopyWith<$Res> {
  factory $MetroWeatherPayloadCopyWith(
    MetroWeatherPayload value,
    $Res Function(MetroWeatherPayload) then,
  ) = _$MetroWeatherPayloadCopyWithImpl<$Res, MetroWeatherPayload>;
  @useResult
  $Res call({
    CityInfo city,
    @deprecated double latitude,
    @deprecated double longitude,
    List<HourlyItem> hourlyItems,
    List<DailyItem> dailyItems,
    String timezone,
    int pastDays,
  });

  $CityInfoCopyWith<$Res> get city;
}

/// @nodoc
class _$MetroWeatherPayloadCopyWithImpl<$Res, $Val extends MetroWeatherPayload>
    implements $MetroWeatherPayloadCopyWith<$Res> {
  _$MetroWeatherPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetroWeatherPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? hourlyItems = null,
    Object? dailyItems = null,
    Object? timezone = null,
    Object? pastDays = null,
  }) {
    return _then(
      _value.copyWith(
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as CityInfo,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            hourlyItems: null == hourlyItems
                ? _value.hourlyItems
                : hourlyItems // ignore: cast_nullable_to_non_nullable
                      as List<HourlyItem>,
            dailyItems: null == dailyItems
                ? _value.dailyItems
                : dailyItems // ignore: cast_nullable_to_non_nullable
                      as List<DailyItem>,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
            pastDays: null == pastDays
                ? _value.pastDays
                : pastDays // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of MetroWeatherPayload
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
abstract class _$$MetroWeatherPayloadImplCopyWith<$Res>
    implements $MetroWeatherPayloadCopyWith<$Res> {
  factory _$$MetroWeatherPayloadImplCopyWith(
    _$MetroWeatherPayloadImpl value,
    $Res Function(_$MetroWeatherPayloadImpl) then,
  ) = __$$MetroWeatherPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CityInfo city,
    @deprecated double latitude,
    @deprecated double longitude,
    List<HourlyItem> hourlyItems,
    List<DailyItem> dailyItems,
    String timezone,
    int pastDays,
  });

  @override
  $CityInfoCopyWith<$Res> get city;
}

/// @nodoc
class __$$MetroWeatherPayloadImplCopyWithImpl<$Res>
    extends _$MetroWeatherPayloadCopyWithImpl<$Res, _$MetroWeatherPayloadImpl>
    implements _$$MetroWeatherPayloadImplCopyWith<$Res> {
  __$$MetroWeatherPayloadImplCopyWithImpl(
    _$MetroWeatherPayloadImpl _value,
    $Res Function(_$MetroWeatherPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetroWeatherPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? hourlyItems = null,
    Object? dailyItems = null,
    Object? timezone = null,
    Object? pastDays = null,
  }) {
    return _then(
      _$MetroWeatherPayloadImpl(
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as CityInfo,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        hourlyItems: null == hourlyItems
            ? _value._hourlyItems
            : hourlyItems // ignore: cast_nullable_to_non_nullable
                  as List<HourlyItem>,
        dailyItems: null == dailyItems
            ? _value._dailyItems
            : dailyItems // ignore: cast_nullable_to_non_nullable
                  as List<DailyItem>,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        pastDays: null == pastDays
            ? _value.pastDays
            : pastDays // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MetroWeatherPayloadImpl extends _MetroWeatherPayload {
  _$MetroWeatherPayloadImpl({
    required this.city,
    @deprecated required this.latitude,
    @deprecated required this.longitude,
    required final List<HourlyItem> hourlyItems,
    required final List<DailyItem> dailyItems,
    this.timezone = "auto",
    this.pastDays = 0,
  }) : _hourlyItems = hourlyItems,
       _dailyItems = dailyItems,
       super._();

  factory _$MetroWeatherPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetroWeatherPayloadImplFromJson(json);

  @override
  final CityInfo city;
  @override
  @deprecated
  final double latitude;
  @override
  @deprecated
  final double longitude;
  final List<HourlyItem> _hourlyItems;
  @override
  List<HourlyItem> get hourlyItems {
    if (_hourlyItems is EqualUnmodifiableListView) return _hourlyItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyItems);
  }

  final List<DailyItem> _dailyItems;
  @override
  List<DailyItem> get dailyItems {
    if (_dailyItems is EqualUnmodifiableListView) return _dailyItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyItems);
  }

  @override
  @JsonKey()
  final String timezone;
  @override
  @JsonKey()
  final int pastDays;

  @override
  String toString() {
    return 'MetroWeatherPayload(city: $city, latitude: $latitude, longitude: $longitude, hourlyItems: $hourlyItems, dailyItems: $dailyItems, timezone: $timezone, pastDays: $pastDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetroWeatherPayloadImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(
              other._hourlyItems,
              _hourlyItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._dailyItems,
              _dailyItems,
            ) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.pastDays, pastDays) ||
                other.pastDays == pastDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    city,
    latitude,
    longitude,
    const DeepCollectionEquality().hash(_hourlyItems),
    const DeepCollectionEquality().hash(_dailyItems),
    timezone,
    pastDays,
  );

  /// Create a copy of MetroWeatherPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetroWeatherPayloadImplCopyWith<_$MetroWeatherPayloadImpl> get copyWith =>
      __$$MetroWeatherPayloadImplCopyWithImpl<_$MetroWeatherPayloadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MetroWeatherPayloadImplToJson(this);
  }
}

abstract class _MetroWeatherPayload extends MetroWeatherPayload {
  factory _MetroWeatherPayload({
    required final CityInfo city,
    @deprecated required final double latitude,
    @deprecated required final double longitude,
    required final List<HourlyItem> hourlyItems,
    required final List<DailyItem> dailyItems,
    final String timezone,
    final int pastDays,
  }) = _$MetroWeatherPayloadImpl;
  _MetroWeatherPayload._() : super._();

  factory _MetroWeatherPayload.fromJson(Map<String, dynamic> json) =
      _$MetroWeatherPayloadImpl.fromJson;

  @override
  CityInfo get city;
  @override
  @deprecated
  double get latitude;
  @override
  @deprecated
  double get longitude;
  @override
  List<HourlyItem> get hourlyItems;
  @override
  List<DailyItem> get dailyItems;
  @override
  String get timezone;
  @override
  int get pastDays;

  /// Create a copy of MetroWeatherPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetroWeatherPayloadImplCopyWith<_$MetroWeatherPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
