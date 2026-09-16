import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '/src/domain/entity/weather_record.dart';

import '../../domain/weather_db.dart';
import 'weather_mood.dart';

// used t feed the ui

extension CityWeatherExt on CityWeatherRecord {
  // groupBy Day

  //GroupBy hour

  WeatherMeasurement? getItem(
    Iterable<WeatherMeasurement> items,
    MeasurementType type,
  ) => items.firstWhereOrNull((e) => e.measurementType == type);

  /// change the type ......~?
  ({double temp, int humadity, int rain, String location, WeatherMood mood})
  currenttemp([DateTime? time]) {
    time ??= DateTime.now();

    final fetchedItems = hourlyItems.where(
      (e) => [
        MeasurementType.temperature,
        MeasurementType.relativeHumidity,
        MeasurementType.rain,
      ].contains(e.measurementType),
    );

    final double temp =
        double.tryParse(
          getItem(fetchedItems, MeasurementType.temperature)?.value ?? "",
        ) ??
        0;

    final int humadity =
        int.tryParse(
          getItem(fetchedItems, MeasurementType.relativeHumidity)?.value ?? "",
        ) ??
        0;

    final int rain =
        int.tryParse(
          getItem(fetchedItems, MeasurementType.rain)?.value ?? "",
        ) ??
        0;

    return (
      temp: temp,
      humadity: humadity,
      rain: rain,
      location: city.name,
      mood: WeatherMood.midRain,
    );
  }
}
