// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preference.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserPreferenceCollection on Isar {
  IsarCollection<UserPreference> get userPreferences => this.collection();
}

const UserPreferenceSchema = CollectionSchema(
  name: r'UserPreference',
  id: 916664336621196308,
  properties: {
    r'distanceUnit': PropertySchema(
      id: 0,
      name: r'distanceUnit',
      type: IsarType.string,
      enumMap: _UserPreferencedistanceUnitEnumValueMap,
    ),
    r'homeItemId': PropertySchema(
      id: 1,
      name: r'homeItemId',
      type: IsarType.long,
    ),
    r'iconPack': PropertySchema(
      id: 2,
      name: r'iconPack',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 3,
      name: r'language',
      type: IsarType.string,
    ),
    r'preciptationUnit': PropertySchema(
      id: 4,
      name: r'preciptationUnit',
      type: IsarType.string,
      enumMap: _UserPreferencepreciptationUnitEnumValueMap,
    ),
    r'speedUnit': PropertySchema(
      id: 5,
      name: r'speedUnit',
      type: IsarType.string,
      enumMap: _UserPreferencespeedUnitEnumValueMap,
    ),
    r'tempUnit': PropertySchema(
      id: 6,
      name: r'tempUnit',
      type: IsarType.string,
      enumMap: _UserPreferencetempUnitEnumValueMap,
    ),
    r'theme': PropertySchema(id: 7, name: r'theme', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _userPreferenceEstimateSize,
  serialize: _userPreferenceSerialize,
  deserialize: _userPreferenceDeserialize,
  deserializeProp: _userPreferenceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _userPreferenceGetId,
  getLinks: _userPreferenceGetLinks,
  attach: _userPreferenceAttach,
  version: '3.3.2',
);

int _userPreferenceEstimateSize(
  UserPreference object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.distanceUnit.name.length * 3;
  bytesCount += 3 + object.iconPack.length * 3;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.preciptationUnit.name.length * 3;
  bytesCount += 3 + object.speedUnit.name.length * 3;
  bytesCount += 3 + object.tempUnit.name.length * 3;
  bytesCount += 3 + object.theme.length * 3;
  return bytesCount;
}

void _userPreferenceSerialize(
  UserPreference object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.distanceUnit.name);
  writer.writeLong(offsets[1], object.homeItemId);
  writer.writeString(offsets[2], object.iconPack);
  writer.writeString(offsets[3], object.language);
  writer.writeString(offsets[4], object.preciptationUnit.name);
  writer.writeString(offsets[5], object.speedUnit.name);
  writer.writeString(offsets[6], object.tempUnit.name);
  writer.writeString(offsets[7], object.theme);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

UserPreference _userPreferenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserPreference(
    distanceUnit:
        _UserPreferencedistanceUnitValueEnumMap[reader.readStringOrNull(
          offsets[0],
        )] ??
        DistanceUnit.meters,
    homeItemId: reader.readLongOrNull(offsets[1]) ?? 0,
    iconPack: reader.readStringOrNull(offsets[2]) ?? "default",
    language: reader.readStringOrNull(offsets[3]) ?? "system",
    preciptationUnit:
        _UserPreferencepreciptationUnitValueEnumMap[reader.readStringOrNull(
          offsets[4],
        )] ??
        PreciptationUnit.milimeters,
    speedUnit:
        _UserPreferencespeedUnitValueEnumMap[reader.readStringOrNull(
          offsets[5],
        )] ??
        SpeedUnit.meterePerSecond,
    tempUnit:
        _UserPreferencetempUnitValueEnumMap[reader.readStringOrNull(
          offsets[6],
        )] ??
        TemperatureUnit.celsius,
    theme: reader.readStringOrNull(offsets[7]) ?? "dark",
    updatedAt: reader.readDateTimeOrNull(offsets[8]),
  );
  return object;
}

P _userPreferenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_UserPreferencedistanceUnitValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              DistanceUnit.meters)
          as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? "default") as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? "system") as P;
    case 4:
      return (_UserPreferencepreciptationUnitValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              PreciptationUnit.milimeters)
          as P;
    case 5:
      return (_UserPreferencespeedUnitValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SpeedUnit.meterePerSecond)
          as P;
    case 6:
      return (_UserPreferencetempUnitValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              TemperatureUnit.celsius)
          as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? "dark") as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _UserPreferencedistanceUnitEnumValueMap = {
  r'meters': r'meters',
  r'kilometers': r'kilometers',
  r'miles': r'miles',
  r'nauticalMiles': r'nauticalMiles',
  r'feet': r'feet',
};
const _UserPreferencedistanceUnitValueEnumMap = {
  r'meters': DistanceUnit.meters,
  r'kilometers': DistanceUnit.kilometers,
  r'miles': DistanceUnit.miles,
  r'nauticalMiles': DistanceUnit.nauticalMiles,
  r'feet': DistanceUnit.feet,
};
const _UserPreferencepreciptationUnitEnumValueMap = {
  r'milimeters': r'milimeters',
  r'centimeters': r'centimeters',
  r'inches': r'inches',
  r'litersPerSquareMeter': r'litersPerSquareMeter',
};
const _UserPreferencepreciptationUnitValueEnumMap = {
  r'milimeters': PreciptationUnit.milimeters,
  r'centimeters': PreciptationUnit.centimeters,
  r'inches': PreciptationUnit.inches,
  r'litersPerSquareMeter': PreciptationUnit.litersPerSquareMeter,
};
const _UserPreferencespeedUnitEnumValueMap = {
  r'meterePerSecond': r'meterePerSecond',
  r'kilometerPerHour': r'kilometerPerHour',
  r'milesPerHour': r'milesPerHour',
  r'knots': r'knots',
  r'feetPerSecond': r'feetPerSecond',
  r'beaufort': r'beaufort',
};
const _UserPreferencespeedUnitValueEnumMap = {
  r'meterePerSecond': SpeedUnit.meterePerSecond,
  r'kilometerPerHour': SpeedUnit.kilometerPerHour,
  r'milesPerHour': SpeedUnit.milesPerHour,
  r'knots': SpeedUnit.knots,
  r'feetPerSecond': SpeedUnit.feetPerSecond,
  r'beaufort': SpeedUnit.beaufort,
};
const _UserPreferencetempUnitEnumValueMap = {
  r'celsius': r'celsius',
  r'fahrenheit': r'fahrenheit',
  r'kelvin': r'kelvin',
};
const _UserPreferencetempUnitValueEnumMap = {
  r'celsius': TemperatureUnit.celsius,
  r'fahrenheit': TemperatureUnit.fahrenheit,
  r'kelvin': TemperatureUnit.kelvin,
};

Id _userPreferenceGetId(UserPreference object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userPreferenceGetLinks(UserPreference object) {
  return [];
}

void _userPreferenceAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserPreference object,
) {}

extension UserPreferenceQueryWhereSort
    on QueryBuilder<UserPreference, UserPreference, QWhere> {
  QueryBuilder<UserPreference, UserPreference, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserPreferenceQueryWhere
    on QueryBuilder<UserPreference, UserPreference, QWhereClause> {
  QueryBuilder<UserPreference, UserPreference, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserPreferenceQueryFilter
    on QueryBuilder<UserPreference, UserPreference, QFilterCondition> {
  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitEqualTo(DistanceUnit value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'distanceUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitGreaterThan(
    DistanceUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'distanceUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitLessThan(
    DistanceUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'distanceUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitBetween(
    DistanceUnit lower,
    DistanceUnit upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'distanceUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'distanceUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'distanceUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'distanceUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'distanceUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'distanceUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  distanceUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'distanceUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  homeItemIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'homeItemId', value: value),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  homeItemIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'homeItemId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  homeItemIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'homeItemId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  homeItemIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'homeItemId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'iconPack',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconPack',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconPack',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconPack',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'iconPack',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'iconPack',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'iconPack',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'iconPack',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconPack', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  iconPackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'iconPack', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'language',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'language',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'language', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'language', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitEqualTo(PreciptationUnit value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'preciptationUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitGreaterThan(
    PreciptationUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'preciptationUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitLessThan(
    PreciptationUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'preciptationUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitBetween(
    PreciptationUnit lower,
    PreciptationUnit upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'preciptationUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'preciptationUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'preciptationUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'preciptationUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'preciptationUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'preciptationUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  preciptationUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'preciptationUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitEqualTo(SpeedUnit value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'speedUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitGreaterThan(
    SpeedUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'speedUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitLessThan(
    SpeedUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'speedUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitBetween(
    SpeedUnit lower,
    SpeedUnit upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'speedUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'speedUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'speedUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'speedUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'speedUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'speedUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  speedUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'speedUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitEqualTo(TemperatureUnit value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tempUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitGreaterThan(
    TemperatureUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tempUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitLessThan(
    TemperatureUnit value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tempUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitBetween(
    TemperatureUnit lower,
    TemperatureUnit upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tempUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tempUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tempUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tempUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tempUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tempUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  tempUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tempUnit', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'theme',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'theme',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'theme',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'theme', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  themeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'theme', value: ''),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  updatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterFilterCondition>
  updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserPreferenceQueryObject
    on QueryBuilder<UserPreference, UserPreference, QFilterCondition> {}

extension UserPreferenceQueryLinks
    on QueryBuilder<UserPreference, UserPreference, QFilterCondition> {}

extension UserPreferenceQuerySortBy
    on QueryBuilder<UserPreference, UserPreference, QSortBy> {
  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByDistanceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByDistanceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByHomeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeItemId', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByHomeItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeItemId', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByIconPack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPack', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByIconPackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPack', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByPreciptationUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preciptationUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByPreciptationUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preciptationUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortBySpeedUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortBySpeedUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByTempUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByTempUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserPreferenceQuerySortThenBy
    on QueryBuilder<UserPreference, UserPreference, QSortThenBy> {
  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByDistanceUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByDistanceUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByHomeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeItemId', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByHomeItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeItemId', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByIconPack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPack', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByIconPackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPack', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByPreciptationUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preciptationUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByPreciptationUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preciptationUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenBySpeedUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenBySpeedUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByTempUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempUnit', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByTempUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempUnit', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserPreferenceQueryWhereDistinct
    on QueryBuilder<UserPreference, UserPreference, QDistinct> {
  QueryBuilder<UserPreference, UserPreference, QDistinct>
  distinctByDistanceUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct>
  distinctByHomeItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homeItemId');
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct> distinctByIconPack({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconPack', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct> distinctByLanguage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct>
  distinctByPreciptationUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'preciptationUnit',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct> distinctBySpeedUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speedUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct> distinctByTempUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tempUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct> distinctByTheme({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreference, UserPreference, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension UserPreferenceQueryProperty
    on QueryBuilder<UserPreference, UserPreference, QQueryProperty> {
  QueryBuilder<UserPreference, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserPreference, DistanceUnit, QQueryOperations>
  distanceUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceUnit');
    });
  }

  QueryBuilder<UserPreference, int, QQueryOperations> homeItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homeItemId');
    });
  }

  QueryBuilder<UserPreference, String, QQueryOperations> iconPackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconPack');
    });
  }

  QueryBuilder<UserPreference, String, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<UserPreference, PreciptationUnit, QQueryOperations>
  preciptationUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preciptationUnit');
    });
  }

  QueryBuilder<UserPreference, SpeedUnit, QQueryOperations>
  speedUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speedUnit');
    });
  }

  QueryBuilder<UserPreference, TemperatureUnit, QQueryOperations>
  tempUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tempUnit');
    });
  }

  QueryBuilder<UserPreference, String, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }

  QueryBuilder<UserPreference, DateTime?, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
