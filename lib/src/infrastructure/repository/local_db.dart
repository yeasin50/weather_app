import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entity/city_info.dart';

class LocationLocalDatabase {
  LocationLocalDatabase._(this._db);

  final Isar _db;

  CityInfo? _myCity;
  CityInfo? get myHomeCity => _myCity;

  late StreamController<CityInfo?> _controller;

  Stream<CityInfo?> get myCityInfo => _controller.stream;

  Future<void> init() async {
    _myCity = await myCity();
    _controller = StreamController.broadcast(
      onListen: () => _updateState(_myCity),
    );
  }

  void _updateState(CityInfo? city) {
    _myCity = city;
    _controller.add(_myCity);
  }

  void dispose() {
    _controller.close();
  }

  static Future<LocationLocalDatabase> openDB() async {
    Isar isar;
    if (kIsWeb) {
      await Isar.initialize();

      isar = Isar.open(
        schemas: [CityInfoSchema],
        directory: Isar.sqliteInMemory,
        engine: IsarEngine.sqlite,
      );
    } else {
      final dir = await getTemporaryDirectory();
      final dbPath = "${dir.path}/weather_db";
      Directory weatherDBPath = await Directory(dbPath).create(recursive: true);
      isar = await Isar.openAsync(
        schemas: [CityInfoSchema],
        directory: weatherDBPath.path,
      );
    }
    final repo = LocationLocalDatabase._(isar);

    await repo.init();
    return repo;
  }

  Future<List<CityInfo>> fetch() async {
    final result = await _db.cityInfos.where().findAllAsync();
    return result;
  }

  Future<void> saveCity(CityInfo city) async {
    if (city.isPrimaryCity) {
      final currentCities = _db.cityInfos
          .where()
          .isPrimaryCityEqualTo(true) //
          .findAll()
          .map((e) => e.copyWith(isPrimaryCity: false));
      await _db.writeAsync((isar) {
        return isar.cityInfos.putAll([city, ...currentCities]);
      });
      _updateState(city);
    } else {
      await _db.writeAsync((isar) {
        return isar.cityInfos.put(city);
      });
    }
  }

  Future<void> deleteCity(CityInfo city) async {
    await _db.writeAsync((isar) {
      return isar.cityInfos.delete(city.id);
    });
  }

  Future<CityInfo?> myCity() async {
    final result = _db.cityInfos.where().isPrimaryCityEqualTo(true).findFirst();

    return result;
  }
}
