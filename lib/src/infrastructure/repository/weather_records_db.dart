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
      WeatherRecordSchema,
      WeatherMeasurementSchema,
      UserPreferenceSchema,
    ], directory: weatherDBPath.path);
    return isar;
  }

  @override
  Future<bool> deleteRecord(int id) async {
    return await _db.writeTxn(() async {
      return await _db.weatherRecords.delete(id);
    });
  }

  @override
  Future<List<CityWeatherRecord>> getRecords() async {
    final records = await _db.collection<WeatherRecord>().where().findAll();
    List<CityWeatherRecord> data = [];
    //TODO: Check fetch all and Map vs fetch N  times
    for (final r in records) {
      final hourlyItems = await _db.weatherMeasurements
          .filter()
          .weatherIdEqualTo(r.id)
          .intervalEqualTo(MeasurementInterval.hourly)
          .findAll();

      final dailyItems = await _db.weatherMeasurements
          .filter()
          .weatherIdEqualTo(r.id)
          .intervalEqualTo(MeasurementInterval.hourly)
          .findAll();

      final city = await _db.cityRecords.get(r.id);

      data.add(
        CityWeatherRecord(
          date: r.date,
          city: city!,
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
      await _db.weatherRecords.delete(record.city.id);
      //TODO: delete
      // _db.weatherMeasurements.deleteAll( _db.weatherRecords.deleteAll(await _db.weatherRecords.filter()));

      await _db.weatherRecords.put(
        WeatherRecord(date: record.date, lastUpdate: DateTime.now()),
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
