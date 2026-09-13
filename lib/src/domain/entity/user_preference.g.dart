// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preference.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetUserPreferenceCollection on Isar {
  IsarCollection<int, UserPreference> get userPreferences => this.collection();
}

const UserPreferenceSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'UserPreference',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'homeItemId',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'unit',
        type: IsarType.byte,
        enumMap: {"degree": 0, "celcius": 1},
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, UserPreference>(
    serialize: serializeUserPreference,
    deserialize: deserializeUserPreference,
    deserializeProperty: deserializeUserPreferenceProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeUserPreference(IsarWriter writer, UserPreference object) {
  IsarCore.writeLong(writer, 1, object.homeItemId);
  IsarCore.writeByte(writer, 2, object.unit.index);
  return object.id;
}

@isarProtected
UserPreference deserializeUserPreference(IsarReader reader) {
  final int _homeItemId;
  {
    final value = IsarCore.readLong(reader, 1);
    if (value == -9223372036854775808) {
      _homeItemId = 0;
    } else {
      _homeItemId = value;
    }
  }
  final WeatherUnit _unit;
  {
    if (IsarCore.readNull(reader, 2)) {
      _unit = WeatherUnit.degree;
    } else {
      _unit = _userPreferenceUnit[IsarCore.readByte(reader, 2)] ??
          WeatherUnit.degree;
    }
  }
  final object = UserPreference(
    homeItemId: _homeItemId,
    unit: _unit,
  );
  return object;
}

@isarProtected
dynamic deserializeUserPreferenceProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final value = IsarCore.readLong(reader, 1);
        if (value == -9223372036854775808) {
          return 0;
        } else {
          return value;
        }
      }
    case 2:
      {
        if (IsarCore.readNull(reader, 2)) {
          return WeatherUnit.degree;
        } else {
          return _userPreferenceUnit[IsarCore.readByte(reader, 2)] ??
              WeatherUnit.degree;
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _UserPreferenceUpdate {
  bool call({
    required int id,
    int? homeItemId,
    WeatherUnit? unit,
  });
}

class _UserPreferenceUpdateImpl implements _UserPreferenceUpdate {
  const _UserPreferenceUpdateImpl(this.collection);

  final IsarCollection<int, UserPreference> collection;

  @override
  bool call({
    required int id,
    Object? homeItemId = ignore,
    Object? unit = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (homeItemId != ignore) 1: homeItemId as int?,
          if (unit != ignore) 2: unit as WeatherUnit?,
        }) >
        0;
  }
}

sealed class _UserPreferenceUpdateAll {
  int call({
    required List<int> id,
    int? homeItemId,
    WeatherUnit? unit,
  });
}

class _UserPreferenceUpdateAllImpl implements _UserPreferenceUpdateAll {
  const _UserPreferenceUpdateAllImpl(this.collection);

  final IsarCollection<int, UserPreference> collection;

  @override
  int call({
    required List<int> id,
    Object? homeItemId = ignore,
    Object? unit = ignore,
  }) {
    return collection.updateProperties(id, {
      if (homeItemId != ignore) 1: homeItemId as int?,
      if (unit != ignore) 2: unit as WeatherUnit?,
    });
  }
}

extension UserPreferenceUpdate on IsarCollection<int, UserPreference> {
  _UserPreferenceUpdate get update => _UserPreferenceUpdateImpl(this);

  _UserPreferenceUpdateAll get updateAll => _UserPreferenceUpdateAllImpl(this);
}

sealed class _UserPreferenceQueryUpdate {
  int call({
    int? homeItemId,
    WeatherUnit? unit,
  });
}

class _UserPreferenceQueryUpdateImpl implements _UserPreferenceQueryUpdate {
  const _UserPreferenceQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<UserPreference> query;
  final int? limit;

  @override
  int call({
    Object? homeItemId = ignore,
    Object? unit = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (homeItemId != ignore) 1: homeItemId as int?,
      if (unit != ignore) 2: unit as WeatherUnit?,
    });
  }
}

extension UserPreferenceQueryUpdate on IsarQuery<UserPreference> {
  _UserPreferenceQueryUpdate get updateFirst =>
      _UserPreferenceQueryUpdateImpl(this, limit: 1);

  _UserPreferenceQueryUpdate get updateAll =>
      _UserPreferenceQueryUpdateImpl(this);
}

class _UserPreferenceQueryBuilderUpdateImpl
    implements _UserPreferenceQueryUpdate {
  const _UserPreferenceQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<UserPreference, UserPreference, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? homeItemId = ignore,
    Object? unit = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (homeItemId != ignore) 1: homeItemId as int?,
        if (unit != ignore) 2: unit as WeatherUnit?,
      });
    } finally {
      q.close();
    }
  }
}

extension UserPreferenceQueryBuilderUpdate
    on QueryBuilder<UserPreference, UserPreference, QOperations> {
  _UserPreferenceQueryUpdate get updateFirst =>
      _UserPreferenceQueryBuilderUpdateImpl(this, limit: 1);

  _UserPreferenceQueryUpdate get updateAll =>
      _UserPreferenceQueryBuilderUpdateImpl(this);
}

const _userPreferenceUnit = {
  0: WeatherUnit.degree,
  1: WeatherUnit.celcius,
};

extension UserPreferenceQueryFilter
    on QueryBuilder<UserPreference, UserPreference, QFilterCondition> {
  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      homeItemIdEqualTo(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      homeItemIdGreaterThan(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      homeItemIdGreaterThanOrEqualTo(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      homeItemIdLessThan(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      homeItemIdLessThanOrEqualTo(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      homeItemIdBetween(
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      unitEqualTo(
    WeatherUnit value,
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      unitGreaterThan(
    WeatherUnit value,
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      unitGreaterThanOrEqualTo(
    WeatherUnit value,
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      unitLessThan(
    WeatherUnit value,
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      unitLessThanOrEqualTo(
    WeatherUnit value,
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

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
      unitBetween(
    WeatherUnit lower,
    WeatherUnit upper,
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
}

extension UserPreferenceQueryObject
    on QueryBuilder<UserPreference, UserPreference, QFilterCondition> {}

extension UserPreferenceQuerySortBy
    on QueryBuilder<UserPreference, UserPreference, QSortBy> {
  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
      sortByHomeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
      sortByHomeItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension UserPreferenceQuerySortThenBy
    on QueryBuilder<UserPreference, UserPreference, QSortThenBy> {
  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
      thenByHomeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
      thenByHomeItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }
}

extension UserPreferenceQueryWhereDistinct
    on QueryBuilder<UserPreference, UserPreference, QDistinct> {
  QueryBuilder<UserPreference, UserPreference, QAfterDistinct>
      distinctByHomeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterDistinct>
      distinctByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }
}

extension UserPreferenceQueryProperty1
    on QueryBuilder<UserPreference, UserPreference, QProperty> {
  QueryBuilder<UserPreference, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserPreference, int, QAfterProperty> homeItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserPreference, WeatherUnit, QAfterProperty> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension UserPreferenceQueryProperty2<R>
    on QueryBuilder<UserPreference, R, QAfterProperty> {
  QueryBuilder<UserPreference, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserPreference, (R, int), QAfterProperty> homeItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserPreference, (R, WeatherUnit), QAfterProperty>
      unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension UserPreferenceQueryProperty3<R1, R2>
    on QueryBuilder<UserPreference, (R1, R2), QAfterProperty> {
  QueryBuilder<UserPreference, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<UserPreference, (R1, R2, int), QOperations>
      homeItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<UserPreference, (R1, R2, WeatherUnit), QOperations>
      unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
