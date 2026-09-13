// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetWeatherRecordCollection on Isar {
  IsarCollection<int, WeatherRecord> get weatherRecords => this.collection();
}

const WeatherRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'WeatherRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'date',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'lastUpdate',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, WeatherRecord>(
    serialize: serializeWeatherRecord,
    deserialize: deserializeWeatherRecord,
    deserializeProperty: deserializeWeatherRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeWeatherRecord(IsarWriter writer, WeatherRecord object) {
  IsarCore.writeLong(writer, 1, object.date.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(
      writer, 2, object.lastUpdate.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
WeatherRecord deserializeWeatherRecord(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final DateTime _date;
  {
    final value = IsarCore.readLong(reader, 1);
    if (value == -9223372036854775808) {
      _date = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _date = DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final DateTime _lastUpdate;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _lastUpdate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _lastUpdate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = WeatherRecord(
    id: _id,
    date: _date,
    lastUpdate: _lastUpdate,
  );
  return object;
}

@isarProtected
dynamic deserializeWeatherRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final value = IsarCore.readLong(reader, 1);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _WeatherRecordUpdate {
  bool call({
    required int id,
    DateTime? date,
    DateTime? lastUpdate,
  });
}

class _WeatherRecordUpdateImpl implements _WeatherRecordUpdate {
  const _WeatherRecordUpdateImpl(this.collection);

  final IsarCollection<int, WeatherRecord> collection;

  @override
  bool call({
    required int id,
    Object? date = ignore,
    Object? lastUpdate = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (date != ignore) 1: date as DateTime?,
          if (lastUpdate != ignore) 2: lastUpdate as DateTime?,
        }) >
        0;
  }
}

sealed class _WeatherRecordUpdateAll {
  int call({
    required List<int> id,
    DateTime? date,
    DateTime? lastUpdate,
  });
}

class _WeatherRecordUpdateAllImpl implements _WeatherRecordUpdateAll {
  const _WeatherRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, WeatherRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? date = ignore,
    Object? lastUpdate = ignore,
  }) {
    return collection.updateProperties(id, {
      if (date != ignore) 1: date as DateTime?,
      if (lastUpdate != ignore) 2: lastUpdate as DateTime?,
    });
  }
}

extension WeatherRecordUpdate on IsarCollection<int, WeatherRecord> {
  _WeatherRecordUpdate get update => _WeatherRecordUpdateImpl(this);

  _WeatherRecordUpdateAll get updateAll => _WeatherRecordUpdateAllImpl(this);
}

sealed class _WeatherRecordQueryUpdate {
  int call({
    DateTime? date,
    DateTime? lastUpdate,
  });
}

class _WeatherRecordQueryUpdateImpl implements _WeatherRecordQueryUpdate {
  const _WeatherRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<WeatherRecord> query;
  final int? limit;

  @override
  int call({
    Object? date = ignore,
    Object? lastUpdate = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (date != ignore) 1: date as DateTime?,
      if (lastUpdate != ignore) 2: lastUpdate as DateTime?,
    });
  }
}

extension WeatherRecordQueryUpdate on IsarQuery<WeatherRecord> {
  _WeatherRecordQueryUpdate get updateFirst =>
      _WeatherRecordQueryUpdateImpl(this, limit: 1);

  _WeatherRecordQueryUpdate get updateAll =>
      _WeatherRecordQueryUpdateImpl(this);
}

class _WeatherRecordQueryBuilderUpdateImpl
    implements _WeatherRecordQueryUpdate {
  const _WeatherRecordQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<WeatherRecord, WeatherRecord, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? date = ignore,
    Object? lastUpdate = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (date != ignore) 1: date as DateTime?,
        if (lastUpdate != ignore) 2: lastUpdate as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension WeatherRecordQueryBuilderUpdate
    on QueryBuilder<WeatherRecord, WeatherRecord, QOperations> {
  _WeatherRecordQueryUpdate get updateFirst =>
      _WeatherRecordQueryBuilderUpdateImpl(this, limit: 1);

  _WeatherRecordQueryUpdate get updateAll =>
      _WeatherRecordQueryBuilderUpdateImpl(this);
}

extension WeatherRecordQueryFilter
    on QueryBuilder<WeatherRecord, WeatherRecord, QFilterCondition> {
  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition> dateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      dateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      dateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      dateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      lastUpdateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      lastUpdateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      lastUpdateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      lastUpdateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterFilterCondition>
      lastUpdateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension WeatherRecordQueryObject
    on QueryBuilder<WeatherRecord, WeatherRecord, QFilterCondition> {}

extension WeatherRecordQuerySortBy
    on QueryBuilder<WeatherRecord, WeatherRecord, QSortBy> {
  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy>
      sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension WeatherRecordQuerySortThenBy
    on QueryBuilder<WeatherRecord, WeatherRecord, QSortThenBy> {
  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy> thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterSortBy>
      thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension WeatherRecordQueryWhereDistinct
    on QueryBuilder<WeatherRecord, WeatherRecord, QDistinct> {
  QueryBuilder<WeatherRecord, WeatherRecord, QAfterDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<WeatherRecord, WeatherRecord, QAfterDistinct>
      distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }
}

extension WeatherRecordQueryProperty1
    on QueryBuilder<WeatherRecord, WeatherRecord, QProperty> {
  QueryBuilder<WeatherRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<WeatherRecord, DateTime, QAfterProperty> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<WeatherRecord, DateTime, QAfterProperty> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension WeatherRecordQueryProperty2<R>
    on QueryBuilder<WeatherRecord, R, QAfterProperty> {
  QueryBuilder<WeatherRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<WeatherRecord, (R, DateTime), QAfterProperty> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<WeatherRecord, (R, DateTime), QAfterProperty>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension WeatherRecordQueryProperty3<R1, R2>
    on QueryBuilder<WeatherRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<WeatherRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<WeatherRecord, (R1, R2, DateTime), QOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<WeatherRecord, (R1, R2, DateTime), QOperations>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCityRecordCollection on Isar {
  IsarCollection<int, CityRecord> get cityRecords => this.collection();
}

const CityRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CityRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'latitude',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'longitude',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'name',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'country',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'countryCode',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'lastUpdate',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CityRecord>(
    serialize: serializeCityRecord,
    deserialize: deserializeCityRecord,
    deserializeProperty: deserializeCityRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCityRecord(IsarWriter writer, CityRecord object) {
  IsarCore.writeDouble(writer, 1, object.latitude);
  IsarCore.writeDouble(writer, 2, object.longitude);
  IsarCore.writeString(writer, 3, object.name);
  IsarCore.writeString(writer, 4, object.country);
  IsarCore.writeString(writer, 5, object.countryCode);
  IsarCore.writeLong(
      writer, 6, object.lastUpdate.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
CityRecord deserializeCityRecord(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final double _latitude;
  _latitude = IsarCore.readDouble(reader, 1);
  final double _longitude;
  _longitude = IsarCore.readDouble(reader, 2);
  final String _name;
  _name = IsarCore.readString(reader, 3) ?? '';
  final String _country;
  _country = IsarCore.readString(reader, 4) ?? '';
  final String _countryCode;
  _countryCode = IsarCore.readString(reader, 5) ?? '';
  final DateTime _lastUpdate;
  {
    final value = IsarCore.readLong(reader, 6);
    if (value == -9223372036854775808) {
      _lastUpdate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _lastUpdate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = CityRecord(
    id: _id,
    latitude: _latitude,
    longitude: _longitude,
    name: _name,
    country: _country,
    countryCode: _countryCode,
    lastUpdate: _lastUpdate,
  );
  return object;
}

@isarProtected
dynamic deserializeCityRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readDouble(reader, 1);
    case 2:
      return IsarCore.readDouble(reader, 2);
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      return IsarCore.readString(reader, 4) ?? '';
    case 5:
      return IsarCore.readString(reader, 5) ?? '';
    case 6:
      {
        final value = IsarCore.readLong(reader, 6);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CityRecordUpdate {
  bool call({
    required int id,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    DateTime? lastUpdate,
  });
}

class _CityRecordUpdateImpl implements _CityRecordUpdate {
  const _CityRecordUpdateImpl(this.collection);

  final IsarCollection<int, CityRecord> collection;

  @override
  bool call({
    required int id,
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? lastUpdate = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (latitude != ignore) 1: latitude as double?,
          if (longitude != ignore) 2: longitude as double?,
          if (name != ignore) 3: name as String?,
          if (country != ignore) 4: country as String?,
          if (countryCode != ignore) 5: countryCode as String?,
          if (lastUpdate != ignore) 6: lastUpdate as DateTime?,
        }) >
        0;
  }
}

sealed class _CityRecordUpdateAll {
  int call({
    required List<int> id,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    DateTime? lastUpdate,
  });
}

class _CityRecordUpdateAllImpl implements _CityRecordUpdateAll {
  const _CityRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, CityRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? lastUpdate = ignore,
  }) {
    return collection.updateProperties(id, {
      if (latitude != ignore) 1: latitude as double?,
      if (longitude != ignore) 2: longitude as double?,
      if (name != ignore) 3: name as String?,
      if (country != ignore) 4: country as String?,
      if (countryCode != ignore) 5: countryCode as String?,
      if (lastUpdate != ignore) 6: lastUpdate as DateTime?,
    });
  }
}

extension CityRecordUpdate on IsarCollection<int, CityRecord> {
  _CityRecordUpdate get update => _CityRecordUpdateImpl(this);

  _CityRecordUpdateAll get updateAll => _CityRecordUpdateAllImpl(this);
}

sealed class _CityRecordQueryUpdate {
  int call({
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    DateTime? lastUpdate,
  });
}

class _CityRecordQueryUpdateImpl implements _CityRecordQueryUpdate {
  const _CityRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CityRecord> query;
  final int? limit;

  @override
  int call({
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? lastUpdate = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (latitude != ignore) 1: latitude as double?,
      if (longitude != ignore) 2: longitude as double?,
      if (name != ignore) 3: name as String?,
      if (country != ignore) 4: country as String?,
      if (countryCode != ignore) 5: countryCode as String?,
      if (lastUpdate != ignore) 6: lastUpdate as DateTime?,
    });
  }
}

extension CityRecordQueryUpdate on IsarQuery<CityRecord> {
  _CityRecordQueryUpdate get updateFirst =>
      _CityRecordQueryUpdateImpl(this, limit: 1);

  _CityRecordQueryUpdate get updateAll => _CityRecordQueryUpdateImpl(this);
}

class _CityRecordQueryBuilderUpdateImpl implements _CityRecordQueryUpdate {
  const _CityRecordQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CityRecord, CityRecord, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? lastUpdate = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (latitude != ignore) 1: latitude as double?,
        if (longitude != ignore) 2: longitude as double?,
        if (name != ignore) 3: name as String?,
        if (country != ignore) 4: country as String?,
        if (countryCode != ignore) 5: countryCode as String?,
        if (lastUpdate != ignore) 6: lastUpdate as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension CityRecordQueryBuilderUpdate
    on QueryBuilder<CityRecord, CityRecord, QOperations> {
  _CityRecordQueryUpdate get updateFirst =>
      _CityRecordQueryBuilderUpdateImpl(this, limit: 1);

  _CityRecordQueryUpdate get updateAll =>
      _CityRecordQueryBuilderUpdateImpl(this);
}

extension CityRecordQueryFilter
    on QueryBuilder<CityRecord, CityRecord, QFilterCondition> {
  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> latitudeEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      latitudeGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> latitudeLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      latitudeLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> latitudeBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> longitudeEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      longitudeGreaterThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> longitudeLessThan(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      longitudeLessThanOrEqualTo(
    double value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> longitudeBetween(
    double lower,
    double upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      nameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      nameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      countryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> lastUpdateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      lastUpdateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      lastUpdateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      lastUpdateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition>
      lastUpdateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterFilterCondition> lastUpdateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension CityRecordQueryObject
    on QueryBuilder<CityRecord, CityRecord, QFilterCondition> {}

extension CityRecordQuerySortBy
    on QueryBuilder<CityRecord, CityRecord, QSortBy> {
  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByCountryDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByCountryCodeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension CityRecordQuerySortThenBy
    on QueryBuilder<CityRecord, CityRecord, QSortThenBy> {
  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByCountryDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByCountryCodeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterSortBy> thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension CityRecordQueryWhereDistinct
    on QueryBuilder<CityRecord, CityRecord, QDistinct> {
  QueryBuilder<CityRecord, CityRecord, QAfterDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterDistinct> distinctByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityRecord, CityRecord, QAfterDistinct> distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension CityRecordQueryProperty1
    on QueryBuilder<CityRecord, CityRecord, QProperty> {
  QueryBuilder<CityRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CityRecord, double, QAfterProperty> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CityRecord, double, QAfterProperty> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CityRecord, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CityRecord, String, QAfterProperty> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CityRecord, String, QAfterProperty> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CityRecord, DateTime, QAfterProperty> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension CityRecordQueryProperty2<R>
    on QueryBuilder<CityRecord, R, QAfterProperty> {
  QueryBuilder<CityRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CityRecord, (R, double), QAfterProperty> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CityRecord, (R, double), QAfterProperty> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CityRecord, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CityRecord, (R, String), QAfterProperty> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CityRecord, (R, String), QAfterProperty> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CityRecord, (R, DateTime), QAfterProperty> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension CityRecordQueryProperty3<R1, R2>
    on QueryBuilder<CityRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<CityRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CityRecord, (R1, R2, double), QOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CityRecord, (R1, R2, double), QOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CityRecord, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CityRecord, (R1, R2, String), QOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CityRecord, (R1, R2, String), QOperations>
      countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CityRecord, (R1, R2, DateTime), QOperations>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetDailyRecordCollection on Isar {
  IsarCollection<int, DailyRecord> get dailyRecords => this.collection();
}

const DailyRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'DailyRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'weatherId',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'time',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'unit',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'value',
        type: IsarType.json,
      ),
      IsarPropertySchema(
        name: 'type',
        type: IsarType.byte,
        enumMap: {"hourly": 0, "daily": 1},
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, DailyRecord>(
    serialize: serializeDailyRecord,
    deserialize: deserializeDailyRecord,
    deserializeProperty: deserializeDailyRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeDailyRecord(IsarWriter writer, DailyRecord object) {
  IsarCore.writeLong(writer, 1, object.weatherId);
  IsarCore.writeLong(writer, 2, object.time.toUtc().microsecondsSinceEpoch);
  IsarCore.writeString(writer, 3, object.unit);
  IsarCore.writeString(writer, 4, isarJsonEncode(object.value));
  IsarCore.writeByte(writer, 5, object.type.index);
  return object.id;
}

@isarProtected
DailyRecord deserializeDailyRecord(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final int _weatherId;
  _weatherId = IsarCore.readLong(reader, 1);
  final DateTime _time;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _time = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _time = DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final String _unit;
  _unit = IsarCore.readString(reader, 3) ?? '';
  final dynamic _value;
  _value = isarJsonDecode(IsarCore.readString(reader, 4) ?? 'null') ?? null;
  final WeatherRecordType _type;
  {
    if (IsarCore.readNull(reader, 5)) {
      _type = WeatherRecordType.hourly;
    } else {
      _type = _dailyRecordType[IsarCore.readByte(reader, 5)] ??
          WeatherRecordType.hourly;
    }
  }
  final object = DailyRecord(
    id: _id,
    weatherId: _weatherId,
    time: _time,
    unit: _unit,
    value: _value,
    type: _type,
  );
  return object;
}

@isarProtected
dynamic deserializeDailyRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      return isarJsonDecode(IsarCore.readString(reader, 4) ?? 'null') ?? null;
    case 5:
      {
        if (IsarCore.readNull(reader, 5)) {
          return WeatherRecordType.hourly;
        } else {
          return _dailyRecordType[IsarCore.readByte(reader, 5)] ??
              WeatherRecordType.hourly;
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _DailyRecordUpdate {
  bool call({
    required int id,
    int? weatherId,
    DateTime? time,
    String? unit,
    WeatherRecordType? type,
  });
}

class _DailyRecordUpdateImpl implements _DailyRecordUpdate {
  const _DailyRecordUpdateImpl(this.collection);

  final IsarCollection<int, DailyRecord> collection;

  @override
  bool call({
    required int id,
    Object? weatherId = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? type = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (weatherId != ignore) 1: weatherId as int?,
          if (time != ignore) 2: time as DateTime?,
          if (unit != ignore) 3: unit as String?,
          if (type != ignore) 5: type as WeatherRecordType?,
        }) >
        0;
  }
}

sealed class _DailyRecordUpdateAll {
  int call({
    required List<int> id,
    int? weatherId,
    DateTime? time,
    String? unit,
    WeatherRecordType? type,
  });
}

class _DailyRecordUpdateAllImpl implements _DailyRecordUpdateAll {
  const _DailyRecordUpdateAllImpl(this.collection);

  final IsarCollection<int, DailyRecord> collection;

  @override
  int call({
    required List<int> id,
    Object? weatherId = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? type = ignore,
  }) {
    return collection.updateProperties(id, {
      if (weatherId != ignore) 1: weatherId as int?,
      if (time != ignore) 2: time as DateTime?,
      if (unit != ignore) 3: unit as String?,
      if (type != ignore) 5: type as WeatherRecordType?,
    });
  }
}

extension DailyRecordUpdate on IsarCollection<int, DailyRecord> {
  _DailyRecordUpdate get update => _DailyRecordUpdateImpl(this);

  _DailyRecordUpdateAll get updateAll => _DailyRecordUpdateAllImpl(this);
}

sealed class _DailyRecordQueryUpdate {
  int call({
    int? weatherId,
    DateTime? time,
    String? unit,
    WeatherRecordType? type,
  });
}

class _DailyRecordQueryUpdateImpl implements _DailyRecordQueryUpdate {
  const _DailyRecordQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<DailyRecord> query;
  final int? limit;

  @override
  int call({
    Object? weatherId = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? type = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (weatherId != ignore) 1: weatherId as int?,
      if (time != ignore) 2: time as DateTime?,
      if (unit != ignore) 3: unit as String?,
      if (type != ignore) 5: type as WeatherRecordType?,
    });
  }
}

extension DailyRecordQueryUpdate on IsarQuery<DailyRecord> {
  _DailyRecordQueryUpdate get updateFirst =>
      _DailyRecordQueryUpdateImpl(this, limit: 1);

  _DailyRecordQueryUpdate get updateAll => _DailyRecordQueryUpdateImpl(this);
}

class _DailyRecordQueryBuilderUpdateImpl implements _DailyRecordQueryUpdate {
  const _DailyRecordQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<DailyRecord, DailyRecord, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? weatherId = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? type = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (weatherId != ignore) 1: weatherId as int?,
        if (time != ignore) 2: time as DateTime?,
        if (unit != ignore) 3: unit as String?,
        if (type != ignore) 5: type as WeatherRecordType?,
      });
    } finally {
      q.close();
    }
  }
}

extension DailyRecordQueryBuilderUpdate
    on QueryBuilder<DailyRecord, DailyRecord, QOperations> {
  _DailyRecordQueryUpdate get updateFirst =>
      _DailyRecordQueryBuilderUpdateImpl(this, limit: 1);

  _DailyRecordQueryUpdate get updateAll =>
      _DailyRecordQueryBuilderUpdateImpl(this);
}

const _dailyRecordType = {
  0: WeatherRecordType.hourly,
  1: WeatherRecordType.daily,
};

extension DailyRecordQueryFilter
    on QueryBuilder<DailyRecord, DailyRecord, QFilterCondition> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      weatherIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      weatherIdGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      weatherIdGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      weatherIdLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      weatherIdLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      weatherIdBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> timeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> timeGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      timeGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> timeLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      timeLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> timeBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      unitGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      unitLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> typeEqualTo(
    WeatherRecordType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> typeGreaterThan(
    WeatherRecordType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      typeGreaterThanOrEqualTo(
    WeatherRecordType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> typeLessThan(
    WeatherRecordType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition>
      typeLessThanOrEqualTo(
    WeatherRecordType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterFilterCondition> typeBetween(
    WeatherRecordType lower,
    WeatherRecordType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }
}

extension DailyRecordQueryObject
    on QueryBuilder<DailyRecord, DailyRecord, QFilterCondition> {}

extension DailyRecordQuerySortBy
    on QueryBuilder<DailyRecord, DailyRecord, QSortBy> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByWeatherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByWeatherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByUnitDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension DailyRecordQuerySortThenBy
    on QueryBuilder<DailyRecord, DailyRecord, QSortThenBy> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByWeatherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByWeatherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByUnitDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension DailyRecordQueryWhereDistinct
    on QueryBuilder<DailyRecord, DailyRecord, QDistinct> {
  QueryBuilder<DailyRecord, DailyRecord, QAfterDistinct> distinctByWeatherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<DailyRecord, DailyRecord, QAfterDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }
}

extension DailyRecordQueryProperty1
    on QueryBuilder<DailyRecord, DailyRecord, QProperty> {
  QueryBuilder<DailyRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<DailyRecord, int, QAfterProperty> weatherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<DailyRecord, DateTime, QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<DailyRecord, String, QAfterProperty> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<DailyRecord, dynamic, QAfterProperty> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<DailyRecord, WeatherRecordType, QAfterProperty> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension DailyRecordQueryProperty2<R>
    on QueryBuilder<DailyRecord, R, QAfterProperty> {
  QueryBuilder<DailyRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<DailyRecord, (R, int), QAfterProperty> weatherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<DailyRecord, (R, DateTime), QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<DailyRecord, (R, String), QAfterProperty> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<DailyRecord, (R, dynamic), QAfterProperty> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<DailyRecord, (R, WeatherRecordType), QAfterProperty>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension DailyRecordQueryProperty3<R1, R2>
    on QueryBuilder<DailyRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<DailyRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<DailyRecord, (R1, R2, int), QOperations> weatherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<DailyRecord, (R1, R2, DateTime), QOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<DailyRecord, (R1, R2, String), QOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<DailyRecord, (R1, R2, dynamic), QOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<DailyRecord, (R1, R2, WeatherRecordType), QOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}
