// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_info.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCityInfoCollection on Isar {
  IsarCollection<int, CityInfo> get cityInfos => this.collection();
}

const CityInfoSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CityInfo',
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
        name: 'isPrimaryCity',
        type: IsarType.bool,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CityInfo>(
    serialize: serializeCityInfo,
    deserialize: deserializeCityInfo,
    deserializeProperty: deserializeCityInfoProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCityInfo(IsarWriter writer, CityInfo object) {
  IsarCore.writeDouble(writer, 1, object.latitude);
  IsarCore.writeDouble(writer, 2, object.longitude);
  IsarCore.writeString(writer, 3, object.name);
  IsarCore.writeString(writer, 4, object.country);
  IsarCore.writeString(writer, 5, object.countryCode);
  IsarCore.writeBool(writer, 6, object.isPrimaryCity);
  return object.id;
}

@isarProtected
CityInfo deserializeCityInfo(IsarReader reader) {
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
  final bool _isPrimaryCity;
  _isPrimaryCity = IsarCore.readBool(reader, 6);
  final object = CityInfo(
    id: _id,
    latitude: _latitude,
    longitude: _longitude,
    name: _name,
    country: _country,
    countryCode: _countryCode,
    isPrimaryCity: _isPrimaryCity,
  );
  return object;
}

@isarProtected
dynamic deserializeCityInfoProp(IsarReader reader, int property) {
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
      return IsarCore.readBool(reader, 6);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CityInfoUpdate {
  bool call({
    required int id,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    bool? isPrimaryCity,
  });
}

class _CityInfoUpdateImpl implements _CityInfoUpdate {
  const _CityInfoUpdateImpl(this.collection);

  final IsarCollection<int, CityInfo> collection;

  @override
  bool call({
    required int id,
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? isPrimaryCity = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (latitude != ignore) 1: latitude as double?,
          if (longitude != ignore) 2: longitude as double?,
          if (name != ignore) 3: name as String?,
          if (country != ignore) 4: country as String?,
          if (countryCode != ignore) 5: countryCode as String?,
          if (isPrimaryCity != ignore) 6: isPrimaryCity as bool?,
        }) >
        0;
  }
}

sealed class _CityInfoUpdateAll {
  int call({
    required List<int> id,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    bool? isPrimaryCity,
  });
}

class _CityInfoUpdateAllImpl implements _CityInfoUpdateAll {
  const _CityInfoUpdateAllImpl(this.collection);

  final IsarCollection<int, CityInfo> collection;

  @override
  int call({
    required List<int> id,
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? isPrimaryCity = ignore,
  }) {
    return collection.updateProperties(id, {
      if (latitude != ignore) 1: latitude as double?,
      if (longitude != ignore) 2: longitude as double?,
      if (name != ignore) 3: name as String?,
      if (country != ignore) 4: country as String?,
      if (countryCode != ignore) 5: countryCode as String?,
      if (isPrimaryCity != ignore) 6: isPrimaryCity as bool?,
    });
  }
}

extension CityInfoUpdate on IsarCollection<int, CityInfo> {
  _CityInfoUpdate get update => _CityInfoUpdateImpl(this);

  _CityInfoUpdateAll get updateAll => _CityInfoUpdateAllImpl(this);
}

sealed class _CityInfoQueryUpdate {
  int call({
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    bool? isPrimaryCity,
  });
}

class _CityInfoQueryUpdateImpl implements _CityInfoQueryUpdate {
  const _CityInfoQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CityInfo> query;
  final int? limit;

  @override
  int call({
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? isPrimaryCity = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (latitude != ignore) 1: latitude as double?,
      if (longitude != ignore) 2: longitude as double?,
      if (name != ignore) 3: name as String?,
      if (country != ignore) 4: country as String?,
      if (countryCode != ignore) 5: countryCode as String?,
      if (isPrimaryCity != ignore) 6: isPrimaryCity as bool?,
    });
  }
}

extension CityInfoQueryUpdate on IsarQuery<CityInfo> {
  _CityInfoQueryUpdate get updateFirst =>
      _CityInfoQueryUpdateImpl(this, limit: 1);

  _CityInfoQueryUpdate get updateAll => _CityInfoQueryUpdateImpl(this);
}

class _CityInfoQueryBuilderUpdateImpl implements _CityInfoQueryUpdate {
  const _CityInfoQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CityInfo, CityInfo, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? latitude = ignore,
    Object? longitude = ignore,
    Object? name = ignore,
    Object? country = ignore,
    Object? countryCode = ignore,
    Object? isPrimaryCity = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (latitude != ignore) 1: latitude as double?,
        if (longitude != ignore) 2: longitude as double?,
        if (name != ignore) 3: name as String?,
        if (country != ignore) 4: country as String?,
        if (countryCode != ignore) 5: countryCode as String?,
        if (isPrimaryCity != ignore) 6: isPrimaryCity as bool?,
      });
    } finally {
      q.close();
    }
  }
}

extension CityInfoQueryBuilderUpdate
    on QueryBuilder<CityInfo, CityInfo, QOperations> {
  _CityInfoQueryUpdate get updateFirst =>
      _CityInfoQueryBuilderUpdateImpl(this, limit: 1);

  _CityInfoQueryUpdate get updateAll => _CityInfoQueryBuilderUpdateImpl(this);
}

extension CityInfoQueryFilter
    on QueryBuilder<CityInfo, CityInfo, QFilterCondition> {
  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> latitudeGreaterThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> longitudeGreaterThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> longitudeBetween(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameLessThanOrEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameContains(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryGreaterThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryLessThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryBetween(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryStartsWith(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryEndsWith(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryContains(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryMatches(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeEqualTo(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeLessThan(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeBetween(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeStartsWith(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeEndsWith(
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeContains(
      String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> countryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition>
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

  QueryBuilder<CityInfo, CityInfo, QAfterFilterCondition> isPrimaryCityEqualTo(
    bool value,
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
}

extension CityInfoQueryObject
    on QueryBuilder<CityInfo, CityInfo, QFilterCondition> {}

extension CityInfoQuerySortBy on QueryBuilder<CityInfo, CityInfo, QSortBy> {
  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByCountryDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByCountryCodeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByIsPrimaryCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> sortByIsPrimaryCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension CityInfoQuerySortThenBy
    on QueryBuilder<CityInfo, CityInfo, QSortThenBy> {
  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByCountryDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByCountryCodeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByIsPrimaryCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterSortBy> thenByIsPrimaryCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension CityInfoQueryWhereDistinct
    on QueryBuilder<CityInfo, CityInfo, QDistinct> {
  QueryBuilder<CityInfo, CityInfo, QAfterDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterDistinct> distinctByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CityInfo, CityInfo, QAfterDistinct> distinctByIsPrimaryCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension CityInfoQueryProperty1
    on QueryBuilder<CityInfo, CityInfo, QProperty> {
  QueryBuilder<CityInfo, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CityInfo, double, QAfterProperty> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CityInfo, double, QAfterProperty> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CityInfo, String, QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CityInfo, String, QAfterProperty> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CityInfo, String, QAfterProperty> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CityInfo, bool, QAfterProperty> isPrimaryCityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension CityInfoQueryProperty2<R>
    on QueryBuilder<CityInfo, R, QAfterProperty> {
  QueryBuilder<CityInfo, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CityInfo, (R, double), QAfterProperty> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CityInfo, (R, double), QAfterProperty> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CityInfo, (R, String), QAfterProperty> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CityInfo, (R, String), QAfterProperty> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CityInfo, (R, String), QAfterProperty> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CityInfo, (R, bool), QAfterProperty> isPrimaryCityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension CityInfoQueryProperty3<R1, R2>
    on QueryBuilder<CityInfo, (R1, R2), QAfterProperty> {
  QueryBuilder<CityInfo, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CityInfo, (R1, R2, double), QOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CityInfo, (R1, R2, double), QOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CityInfo, (R1, R2, String), QOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<CityInfo, (R1, R2, String), QOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<CityInfo, (R1, R2, String), QOperations> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<CityInfo, (R1, R2, bool), QOperations> isPrimaryCityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}
