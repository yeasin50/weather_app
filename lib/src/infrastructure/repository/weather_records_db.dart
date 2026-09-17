import 'dart:io';

import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entity/user_preference.dart';
import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';

class IsarWeatherDatabase extends IWeatherDatabase {
  IsarWeatherDatabase(this._db);

  final Isar _db;

  static Future<Isar> initDB() async {
    Isar isar;
    final dir = await getTemporaryDirectory();
    final dbPath = "${dir.path}/weather_db_yea";
    Directory weatherDBPath = await Directory(dbPath).create(recursive: true);
    isar = await Isar.open([
      CityRecordSchema,
      WeatherMeasurementSchema,
      UserPreferenceSchema,
    ], directory: weatherDBPath.path);
    return isar;
  }

  @override
  Future<bool> deleteRecord(int id) async {
    return await _db.writeTxn(() async {
      return await _db.cityRecords.delete(id);
    });
  }

  @override
  Future<List<CityWeatherRecord>> getRecords() async {
    final records = await _db.collection<CityRecord>().where().findAll();
    List<CityWeatherRecord> data = [];
    //TODO: Check fetch all and Map vs fetch N  times
    for (final r in records) {
      final hourlyItems = await _db.weatherMeasurements
          .filter()
          .cityIdEqualTo(r.id)
          .intervalEqualTo(.hourly)
          .findAll();

      final dailyItems = await _db.weatherMeasurements
          .filter()
          .cityIdEqualTo(r.id)
          .intervalEqualTo(.daily)
          .findAll();

      //FIXME:: empty city
      final city = await _db.cityRecords.get(r.id) ?? CityRecord.none;

      data.add(
        CityWeatherRecord(
          date: r.lastUpdate,
          city: city,
          dailyItems: dailyItems,
          hourlyItems: hourlyItems,
        ),
      );
    }

    return data;
  }

  @override
  Future<CityWeatherRecord> saveRecord(CityWeatherRecord record) async {
    await _db.writeTxn(() async {
      final currentItems = await _db.weatherMeasurements
          .filter()
          .cityIdEqualTo(record.city.id)
          .findAll();

      await _db.weatherMeasurements.deleteAll(
        currentItems.map((e) => e.id).toList(),
      );

      await _db.cityRecords.put(record.city);
      await _db.weatherMeasurements.putAll(record.dailyItems);
      await _db.weatherMeasurements.putAll(record.hourlyItems);
    });

    return record;
  }

  @override
  Future<UserPreference> updatePreference(UserPreference pref) async {
    pref = pref..updatedAt = DateTime.now();
    await _db.writeTxn(() async {
      return await _db.userPreferences.put(pref);
    });

    return pref;
  }

  @override
  Future<UserPreference> getPreference() async {
    final pref = await _db.userPreferences.get(0);
    if (pref == null) {
      return await _db.writeTxn<UserPreference>(() async {
        final record = UserPreference();
        await _db.userPreferences.put(record);
        return record;
      });
    }

    return pref;
  }
}
