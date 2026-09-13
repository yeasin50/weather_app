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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityInfo _$CityInfoFromJson(Map<String, dynamic> json) {
  return _CityInfo.fromJson(json);
}

/// @nodoc
mixin _$CityInfo {
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityInfoCopyWith<CityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityInfoCopyWith<$Res> {
  factory $CityInfoCopyWith(CityInfo value, $Res Function(CityInfo) then) =
      _$CityInfoCopyWithImpl<$Res, CityInfo>;
  @useResult
  $Res call({String name, double latitude, double longitude});
}

/// @nodoc
class _$CityInfoCopyWithImpl<$Res, $Val extends CityInfo>
    implements $CityInfoCopyWith<$Res> {
  _$CityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityInfoImplCopyWith<$Res>
    implements $CityInfoCopyWith<$Res> {
  factory _$$CityInfoImplCopyWith(
          _$CityInfoImpl value, $Res Function(_$CityInfoImpl) then) =
      __$$CityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double latitude, double longitude});
}

/// @nodoc
class __$$CityInfoImplCopyWithImpl<$Res>
    extends _$CityInfoCopyWithImpl<$Res, _$CityInfoImpl>
    implements _$$CityInfoImplCopyWith<$Res> {
  __$$CityInfoImplCopyWithImpl(
      _$CityInfoImpl _value, $Res Function(_$CityInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$CityInfoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityInfoImpl implements _CityInfo {
  const _$CityInfoImpl(
      {required this.name, required this.latitude, required this.longitude});

  factory _$CityInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityInfoImplFromJson(json);

  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'CityInfo(name: $name, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CityInfoImplCopyWith<_$CityInfoImpl> get copyWith =>
      __$$CityInfoImplCopyWithImpl<_$CityInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityInfoImplToJson(
      this,
    );
  }
}

abstract class _CityInfo implements CityInfo {
  const factory _CityInfo(
      {required final String name,
      required final double latitude,
      required final double longitude}) = _$CityInfoImpl;

  factory _CityInfo.fromJson(Map<String, dynamic> json) =
      _$CityInfoImpl.fromJson;

  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$CityInfoImplCopyWith<_$CityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeatherResponse {
  WeatherRecord get record => throw _privateConstructorUsedError;
  List<DailyRecord> get dailyRecords => throw _privateConstructorUsedError;
  List<DailyRecord> get hourlyRecord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherResponseCopyWith<WeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseCopyWith<$Res> {
  factory $WeatherResponseCopyWith(
          WeatherResponse value, $Res Function(WeatherResponse) then) =
      _$WeatherResponseCopyWithImpl<$Res, WeatherResponse>;
  @useResult
  $Res call(
      {WeatherRecord record,
      List<DailyRecord> dailyRecords,
      List<DailyRecord> hourlyRecord});
}

/// @nodoc
class _$WeatherResponseCopyWithImpl<$Res, $Val extends WeatherResponse>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
    Object? dailyRecords = null,
    Object? hourlyRecord = null,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as WeatherRecord,
      dailyRecords: null == dailyRecords
          ? _value.dailyRecords
          : dailyRecords // ignore: cast_nullable_to_non_nullable
              as List<DailyRecord>,
      hourlyRecord: null == hourlyRecord
          ? _value.hourlyRecord
          : hourlyRecord // ignore: cast_nullable_to_non_nullable
              as List<DailyRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherResponseImplCopyWith<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  factory _$$WeatherResponseImplCopyWith(_$WeatherResponseImpl value,
          $Res Function(_$WeatherResponseImpl) then) =
      __$$WeatherResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherRecord record,
      List<DailyRecord> dailyRecords,
      List<DailyRecord> hourlyRecord});
}

/// @nodoc
class __$$WeatherResponseImplCopyWithImpl<$Res>
    extends _$WeatherResponseCopyWithImpl<$Res, _$WeatherResponseImpl>
    implements _$$WeatherResponseImplCopyWith<$Res> {
  __$$WeatherResponseImplCopyWithImpl(
      _$WeatherResponseImpl _value, $Res Function(_$WeatherResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
    Object? dailyRecords = null,
    Object? hourlyRecord = null,
  }) {
    return _then(_$WeatherResponseImpl(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as WeatherRecord,
      dailyRecords: null == dailyRecords
          ? _value._dailyRecords
          : dailyRecords // ignore: cast_nullable_to_non_nullable
              as List<DailyRecord>,
      hourlyRecord: null == hourlyRecord
          ? _value._hourlyRecord
          : hourlyRecord // ignore: cast_nullable_to_non_nullable
              as List<DailyRecord>,
    ));
  }
}

/// @nodoc

class _$WeatherResponseImpl implements _WeatherResponse {
  const _$WeatherResponseImpl(
      {required this.record,
      required final List<DailyRecord> dailyRecords,
      required final List<DailyRecord> hourlyRecord})
      : _dailyRecords = dailyRecords,
        _hourlyRecord = hourlyRecord;

  @override
  final WeatherRecord record;
  final List<DailyRecord> _dailyRecords;
  @override
  List<DailyRecord> get dailyRecords {
    if (_dailyRecords is EqualUnmodifiableListView) return _dailyRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyRecords);
  }

  final List<DailyRecord> _hourlyRecord;
  @override
  List<DailyRecord> get hourlyRecord {
    if (_hourlyRecord is EqualUnmodifiableListView) return _hourlyRecord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyRecord);
  }

  @override
  String toString() {
    return 'WeatherResponse(record: $record, dailyRecords: $dailyRecords, hourlyRecord: $hourlyRecord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherResponseImpl &&
            (identical(other.record, record) || other.record == record) &&
            const DeepCollectionEquality()
                .equals(other._dailyRecords, _dailyRecords) &&
            const DeepCollectionEquality()
                .equals(other._hourlyRecord, _hourlyRecord));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      record,
      const DeepCollectionEquality().hash(_dailyRecords),
      const DeepCollectionEquality().hash(_hourlyRecord));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherResponseImplCopyWith<_$WeatherResponseImpl> get copyWith =>
      __$$WeatherResponseImplCopyWithImpl<_$WeatherResponseImpl>(
          this, _$identity);
}

abstract class _WeatherResponse implements WeatherResponse {
  const factory _WeatherResponse(
      {required final WeatherRecord record,
      required final List<DailyRecord> dailyRecords,
      required final List<DailyRecord> hourlyRecord}) = _$WeatherResponseImpl;

  @override
  WeatherRecord get record;
  @override
  List<DailyRecord> get dailyRecords;
  @override
  List<DailyRecord> get hourlyRecord;
  @override
  @JsonKey(ignore: true)
  _$$WeatherResponseImplCopyWith<_$WeatherResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
