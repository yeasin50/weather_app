import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entity/user_preference.dart';
import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';

class IsarWeatherDatabase extends IWeatherDatabase {
  IsarWeatherDatabase(this._db);

  final Isar _db;

  static Future<Isar> initDB() async {
    Isar isar;
    if (kIsWeb) {
      await Isar.initialize();

      isar = Isar.open(
        schemas: [WeatherRecordSchema, UserPreferenceSchema],
        directory: Isar.sqliteInMemory,
        engine: IsarEngine.sqlite,
      );
    } else {
      final dir = await getTemporaryDirectory();
      final dbPath = "${dir.path}/weather_db";
      Directory weatherDBPath = await Directory(dbPath).create(recursive: true);
      isar = await Isar.openAsync(
        schemas: [WeatherRecordSchema],
        directory: weatherDBPath.path,
      );
    }
    return isar;
  }

  @override
  Future<bool> deleteRecord(WeatherRecord record) async {
    return await _db.writeAsync((isar) {
      return isar.weatherRecords.delete(record.id);
    });
  }

  @override
  Future<List<WeatherRecord>> getRecords() async {
    final records = await _db.weatherRecords.where().findAllAsync();
    return records;
  }

  @override
  Future<WeatherRecord> saveRecord(WeatherRecord record) async {
    _db.writeAsync((isar) {
      return isar.weatherRecords.put(record);
    });

    return record;
  }

  @override
  Future<UserPreference> updatePreference(UserPreference pref) async {
    _db.writeAsync((isar) {
      return isar.userPreferences.put(pref);
    });

    return pref;
  }

  @override
  Future<UserPreference> getPreference() async {
    final pref = await _db.userPreferences.getAsync(0);
    if (pref == null) {
      return await _db.writeAsync<UserPreference>((isar) {
        final record = UserPreference();
        _db.userPreferences.put(record);
        return record;
      });
    }

    return pref;
  }
}
