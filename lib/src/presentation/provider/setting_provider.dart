import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class SettingProvider with ChangeNotifier {
  SettingProvider(this._db);

  final IWeatherDatabase _db;

  late UserPreference _preference;
  UserPreference get preference => _preference;

  void load() async {
    try {
      _preference = await _db.getPreference();
      notifyListeners();
    } catch (e) {
      log("failed_to_load_user settings ${e.toString()}");
    }
  }

  void update(Object item) async {
    _preference = switch (item) {
      TemperatureUnit value => _preference.copyWith(tempUnit: value),
      PreciptationUnit value => _preference.copyWith(preciptationUnit: value),
      SpeedUnit value => _preference.copyWith(speedUnit: value),
      DistanceUnit value => _preference.copyWith(distanceUnit: value),
      _ => throw ArgumentError('unsupported item $item'),
    };

    await _db.updatePreference(_preference);
    notifyListeners();
  }
}
