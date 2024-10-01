import 'package:flutter/material.dart';

import 'infrastructure.dart';
import 'repository/local_db.dart';

extension WeatherRepoExt on BuildContext {
  WeatherRepo get repo => WeatherInheritedWidget.of(this, listen: false);

  MetroWeatherRepo get weatherService => repo.weatherService;
  LocationRepo get geoService => repo.geoService;
  LocationLocalDatabase get localDB => repo.db;
}

extension WeatherRepState<T extends StatefulWidget> on State<T> {
  MetroWeatherRepo get weatherService => context.weatherService;
  LocationRepo get geoService => context.geoService;
  LocationLocalDatabase get localDB => context.localDB;
}

class WeatherInheritedWidget extends InheritedWidget {
  const WeatherInheritedWidget({
    super.key,
    required this.repo,
    required super.child,
  });

  final WeatherRepo repo;

  static WeatherRepo of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<WeatherInheritedWidget>()!.repo;
    } else {
      return context.getInheritedWidgetOfExactType<WeatherInheritedWidget>()!.repo;
    }
  }

  @override
  bool updateShouldNotify(covariant WeatherInheritedWidget oldWidget) {
    return repo != oldWidget.repo;
  }
}

class WeatherRepo {
  const WeatherRepo._({
    required this.db,
    required this.weatherService,
    required this.geoService,
  });

  final MetroWeatherRepo weatherService;
  final LocationRepo geoService;
  final LocationLocalDatabase db;

  void dispose() {
    db.dispose();
  }

  static Future<WeatherRepo> init() async {
    final db = await LocationLocalDatabase.openDB();

   await db.myCity();
    final weather = MetroWeatherRepo();
    final geo = LocationRepo();

    return WeatherRepo._(
      db: db,
      weatherService: weather,
      geoService: geo,
    );
  }
}
