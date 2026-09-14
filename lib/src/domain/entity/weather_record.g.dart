// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

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

extension GetWeatherMeasurementCollection on Isar {
  IsarCollection<int, WeatherMeasurement> get weatherMeasurements =>
      this.collection();
}

const WeatherMeasurementSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'WeatherMeasurement',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'weatherId',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'measurementType',
        type: IsarType.byte,
        enumMap: {
          "temperature": 0,
          "temperatureMax": 1,
          "temperatureMin": 2,
          "relativeHumidity": 3,
          "rain": 4,
          "precipitationProbability": 5,
          "uvIndex": 6,
          "windSpeed": 7,
          "sunrise": 8,
          "sunset": 9,
          "moonPhase": 10,
          "unknown": 11
        },
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
        name: 'interval',
        type: IsarType.byte,
        enumMap: {"hourly": 0, "daily": 1},
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, WeatherMeasurement>(
    serialize: serializeWeatherMeasurement,
    deserialize: deserializeWeatherMeasurement,
    deserializeProperty: deserializeWeatherMeasurementProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeWeatherMeasurement(IsarWriter writer, WeatherMeasurement object) {
  IsarCore.writeLong(writer, 1, object.weatherId);
  IsarCore.writeByte(writer, 2, object.measurementType.index);
  IsarCore.writeLong(writer, 3, object.time.toUtc().microsecondsSinceEpoch);
  IsarCore.writeString(writer, 4, object.unit);
  IsarCore.writeString(writer, 5, isarJsonEncode(object.value));
  IsarCore.writeByte(writer, 6, object.interval.index);
  return object.id;
}

@isarProtected
WeatherMeasurement deserializeWeatherMeasurement(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final int _weatherId;
  _weatherId = IsarCore.readLong(reader, 1);
  final MeasurementType _measurementType;
  {
    if (IsarCore.readNull(reader, 2)) {
      _measurementType = MeasurementType.temperature;
    } else {
      _measurementType =
          _weatherMeasurementMeasurementType[IsarCore.readByte(reader, 2)] ??
              MeasurementType.temperature;
    }
  }
  final DateTime _time;
  {
    final value = IsarCore.readLong(reader, 3);
    if (value == -9223372036854775808) {
      _time = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _time = DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final String _unit;
  _unit = IsarCore.readString(reader, 4) ?? '';
  final dynamic _value;
  _value = isarJsonDecode(IsarCore.readString(reader, 5) ?? 'null') ?? null;
  final MeasurementInterval _interval;
  {
    if (IsarCore.readNull(reader, 6)) {
      _interval = MeasurementInterval.hourly;
    } else {
      _interval = _weatherMeasurementInterval[IsarCore.readByte(reader, 6)] ??
          MeasurementInterval.hourly;
    }
  }
  final object = WeatherMeasurement(
    id: _id,
    weatherId: _weatherId,
    measurementType: _measurementType,
    time: _time,
    unit: _unit,
    value: _value,
    interval: _interval,
  );
  return object;
}

@isarProtected
dynamic deserializeWeatherMeasurementProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      {
        if (IsarCore.readNull(reader, 2)) {
          return MeasurementType.temperature;
        } else {
          return _weatherMeasurementMeasurementType[
                  IsarCore.readByte(reader, 2)] ??
              MeasurementType.temperature;
        }
      }
    case 3:
      {
        final value = IsarCore.readLong(reader, 3);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 4:
      return IsarCore.readString(reader, 4) ?? '';
    case 5:
      return isarJsonDecode(IsarCore.readString(reader, 5) ?? 'null') ?? null;
    case 6:
      {
        if (IsarCore.readNull(reader, 6)) {
          return MeasurementInterval.hourly;
        } else {
          return _weatherMeasurementInterval[IsarCore.readByte(reader, 6)] ??
              MeasurementInterval.hourly;
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _WeatherMeasurementUpdate {
  bool call({
    required int id,
    int? weatherId,
    MeasurementType? measurementType,
    DateTime? time,
    String? unit,
    MeasurementInterval? interval,
  });
}

class _WeatherMeasurementUpdateImpl implements _WeatherMeasurementUpdate {
  const _WeatherMeasurementUpdateImpl(this.collection);

  final IsarCollection<int, WeatherMeasurement> collection;

  @override
  bool call({
    required int id,
    Object? weatherId = ignore,
    Object? measurementType = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? interval = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (weatherId != ignore) 1: weatherId as int?,
          if (measurementType != ignore) 2: measurementType as MeasurementType?,
          if (time != ignore) 3: time as DateTime?,
          if (unit != ignore) 4: unit as String?,
          if (interval != ignore) 6: interval as MeasurementInterval?,
        }) >
        0;
  }
}

sealed class _WeatherMeasurementUpdateAll {
  int call({
    required List<int> id,
    int? weatherId,
    MeasurementType? measurementType,
    DateTime? time,
    String? unit,
    MeasurementInterval? interval,
  });
}

class _WeatherMeasurementUpdateAllImpl implements _WeatherMeasurementUpdateAll {
  const _WeatherMeasurementUpdateAllImpl(this.collection);

  final IsarCollection<int, WeatherMeasurement> collection;

  @override
  int call({
    required List<int> id,
    Object? weatherId = ignore,
    Object? measurementType = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? interval = ignore,
  }) {
    return collection.updateProperties(id, {
      if (weatherId != ignore) 1: weatherId as int?,
      if (measurementType != ignore) 2: measurementType as MeasurementType?,
      if (time != ignore) 3: time as DateTime?,
      if (unit != ignore) 4: unit as String?,
      if (interval != ignore) 6: interval as MeasurementInterval?,
    });
  }
}

extension WeatherMeasurementUpdate on IsarCollection<int, WeatherMeasurement> {
  _WeatherMeasurementUpdate get update => _WeatherMeasurementUpdateImpl(this);

  _WeatherMeasurementUpdateAll get updateAll =>
      _WeatherMeasurementUpdateAllImpl(this);
}

sealed class _WeatherMeasurementQueryUpdate {
  int call({
    int? weatherId,
    MeasurementType? measurementType,
    DateTime? time,
    String? unit,
    MeasurementInterval? interval,
  });
}

class _WeatherMeasurementQueryUpdateImpl
    implements _WeatherMeasurementQueryUpdate {
  const _WeatherMeasurementQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<WeatherMeasurement> query;
  final int? limit;

  @override
  int call({
    Object? weatherId = ignore,
    Object? measurementType = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? interval = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (weatherId != ignore) 1: weatherId as int?,
      if (measurementType != ignore) 2: measurementType as MeasurementType?,
      if (time != ignore) 3: time as DateTime?,
      if (unit != ignore) 4: unit as String?,
      if (interval != ignore) 6: interval as MeasurementInterval?,
    });
  }
}

extension WeatherMeasurementQueryUpdate on IsarQuery<WeatherMeasurement> {
  _WeatherMeasurementQueryUpdate get updateFirst =>
      _WeatherMeasurementQueryUpdateImpl(this, limit: 1);

  _WeatherMeasurementQueryUpdate get updateAll =>
      _WeatherMeasurementQueryUpdateImpl(this);
}

class _WeatherMeasurementQueryBuilderUpdateImpl
    implements _WeatherMeasurementQueryUpdate {
  const _WeatherMeasurementQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<WeatherMeasurement, WeatherMeasurement, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? weatherId = ignore,
    Object? measurementType = ignore,
    Object? time = ignore,
    Object? unit = ignore,
    Object? interval = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (weatherId != ignore) 1: weatherId as int?,
        if (measurementType != ignore) 2: measurementType as MeasurementType?,
        if (time != ignore) 3: time as DateTime?,
        if (unit != ignore) 4: unit as String?,
        if (interval != ignore) 6: interval as MeasurementInterval?,
      });
    } finally {
      q.close();
    }
  }
}

extension WeatherMeasurementQueryBuilderUpdate
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QOperations> {
  _WeatherMeasurementQueryUpdate get updateFirst =>
      _WeatherMeasurementQueryBuilderUpdateImpl(this, limit: 1);

  _WeatherMeasurementQueryUpdate get updateAll =>
      _WeatherMeasurementQueryBuilderUpdateImpl(this);
}

const _weatherMeasurementMeasurementType = {
  0: MeasurementType.temperature,
  1: MeasurementType.temperatureMax,
  2: MeasurementType.temperatureMin,
  3: MeasurementType.relativeHumidity,
  4: MeasurementType.rain,
  5: MeasurementType.precipitationProbability,
  6: MeasurementType.uvIndex,
  7: MeasurementType.windSpeed,
  8: MeasurementType.sunrise,
  9: MeasurementType.sunset,
  10: MeasurementType.moonPhase,
  11: MeasurementType.unknown,
};
const _weatherMeasurementInterval = {
  0: MeasurementInterval.hourly,
  1: MeasurementInterval.daily,
};

extension WeatherMeasurementQueryFilter
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QFilterCondition> {
  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      idEqualTo(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      measurementTypeEqualTo(
    MeasurementType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      measurementTypeGreaterThan(
    MeasurementType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      measurementTypeGreaterThanOrEqualTo(
    MeasurementType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      measurementTypeLessThan(
    MeasurementType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      measurementTypeLessThanOrEqualTo(
    MeasurementType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      measurementTypeBetween(
    MeasurementType lower,
    MeasurementType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      timeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      timeGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      timeGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      timeLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      timeLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      timeBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitEqualTo(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitGreaterThan(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitGreaterThanOrEqualTo(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitLessThan(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitLessThanOrEqualTo(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitBetween(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitStartsWith(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitEndsWith(
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      intervalEqualTo(
    MeasurementInterval value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      intervalGreaterThan(
    MeasurementInterval value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      intervalGreaterThanOrEqualTo(
    MeasurementInterval value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      intervalLessThan(
    MeasurementInterval value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      intervalLessThanOrEqualTo(
    MeasurementInterval value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterFilterCondition>
      intervalBetween(
    MeasurementInterval lower,
    MeasurementInterval upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }
}

extension WeatherMeasurementQueryObject
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QFilterCondition> {}

extension WeatherMeasurementQuerySortBy
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QSortBy> {
  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByWeatherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByWeatherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByMeasurementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByMeasurementTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy> sortByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByUnitDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      sortByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension WeatherMeasurementQuerySortThenBy
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QSortThenBy> {
  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByWeatherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByWeatherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByMeasurementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByMeasurementTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy> thenByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByUnitDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterSortBy>
      thenByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension WeatherMeasurementQueryWhereDistinct
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QDistinct> {
  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterDistinct>
      distinctByWeatherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterDistinct>
      distinctByMeasurementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterDistinct>
      distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterDistinct>
      distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<WeatherMeasurement, WeatherMeasurement, QAfterDistinct>
      distinctByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension WeatherMeasurementQueryProperty1
    on QueryBuilder<WeatherMeasurement, WeatherMeasurement, QProperty> {
  QueryBuilder<WeatherMeasurement, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<WeatherMeasurement, int, QAfterProperty> weatherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<WeatherMeasurement, MeasurementType, QAfterProperty>
      measurementTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<WeatherMeasurement, DateTime, QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<WeatherMeasurement, String, QAfterProperty> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<WeatherMeasurement, dynamic, QAfterProperty> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<WeatherMeasurement, MeasurementInterval, QAfterProperty>
      intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension WeatherMeasurementQueryProperty2<R>
    on QueryBuilder<WeatherMeasurement, R, QAfterProperty> {
  QueryBuilder<WeatherMeasurement, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<WeatherMeasurement, (R, int), QAfterProperty>
      weatherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<WeatherMeasurement, (R, MeasurementType), QAfterProperty>
      measurementTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<WeatherMeasurement, (R, DateTime), QAfterProperty>
      timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<WeatherMeasurement, (R, String), QAfterProperty> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<WeatherMeasurement, (R, dynamic), QAfterProperty>
      valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<WeatherMeasurement, (R, MeasurementInterval), QAfterProperty>
      intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension WeatherMeasurementQueryProperty3<R1, R2>
    on QueryBuilder<WeatherMeasurement, (R1, R2), QAfterProperty> {
  QueryBuilder<WeatherMeasurement, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<WeatherMeasurement, (R1, R2, int), QOperations>
      weatherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<WeatherMeasurement, (R1, R2, MeasurementType), QOperations>
      measurementTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<WeatherMeasurement, (R1, R2, DateTime), QOperations>
      timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<WeatherMeasurement, (R1, R2, String), QOperations>
      unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<WeatherMeasurement, (R1, R2, dynamic), QOperations>
      valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<WeatherMeasurement, (R1, R2, MeasurementInterval), QOperations>
      intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}
