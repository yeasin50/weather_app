import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/domain.dart';
import '../../infrastructure/model/metro_api_weather_code.dart'
    show WeatherType;

extension WeatherValueFormatter on WeatherMeasurement {
  String get formatValue => measurementType == .weatherCode
      ? WeatherType.fromCode(value).name
      : _valueFormatter(this);
}

String _valueFormatter(WeatherMeasurement data) {
  return switch (data.measurementType) {
    ///? Should I show int instead of decimal .....
    .temperature || .temperatureMax || .temperatureMin => () {
      //TODO: update with useer settings
      final temp = double.tryParse(
        data.value.toString().replaceAll(RegExp(r'[^0-9.-]'), ''),
      );

      return "${temp == null ? "--" : temp.round()}\u00B0"; //pad left for <10?
    }(),
    .rain || .precipitationProbability || .relativeHumidity => () {
      final value = double.tryParse(data.value)?.toInt();
      assert(
        value != null,
        "invaid parse ${data.measurementType} value ${data.value}",
      );
      return value == 0 ? "" : "${value ?? "NA"}%";
    }(),
    .sunrise || .sunset || .moonRise || .moonSet => () {
      return DateFormat("d hh:mm a").format(DateTime.parse(data.value));
    }(),
    _ => () {
      assert(false, " missing type ${data.measurementType}");
      return "NA";
    }(),
  };
}

class UserFormatter {
  UserFormatter(this._preference);

  // how does it help and not increase complexity?
  // one thing is to format string but....
  final UserPreference _preference;

  // dart format off

  String get tempUnit => _preference.tempUnit.unit;

  /// if [celcius] is not null, it override [temp] and returns format string
  String temp(
    WeatherMeasurement temp, [double? celcius, int fractionDigits = 0]) {
    String unitStr = [TemperatureUnit.celsius, TemperatureUnit.fahrenheit].contains(_preference.tempUnit)
        ? "\u00B0" : "";
    return "${tempValue(temp, celcius).toStringAsFixed(fractionDigits)}$unitStr";
  }

  // dart format  on 

  double tempValue(WeatherMeasurement temp, [double? celcius]) {
    celcius ??= double.parse(temp.value);
    return TemperatureUnit.convert(celcius, _preference.tempUnit);
  }

  static String wind(double value, [int fractionDigits = 0]) {
    //TODO: converter
    return "${value.toStringAsFixed(fractionDigits)}";
  }

  double windValue(double kiloPerHour) {
    return SpeedUnit.convert(kiloPerHour, _preference.speedUnit);
  }

  double distanceValue(double meter) =>
      DistanceUnit.convert(meter, _preference.distanceUnit);

  String get distanceUnit => _preference.distanceUnit.unit;
  String distance(double value, [int fractionDigits = 0]) {
    //TODO: converter
    return "${value.toStringAsFixed(fractionDigits)}";
  }

  /// ...Icons

  Widget moodIcon(WeatherMeasurement weatherCode, [double iconSize = 24]) {
    return _weatherIcon(WeatherType.fromCode(weatherCode.value), iconSize);
  }
}

/// todo: adapt UserPreference into separate class
Widget _weatherIcon(WeatherType type, [double iconSize = 24]) {
  final iconData = switch (type) {
    .clear => Icons.wb_sunny,
    .cloudy => Icons.cloud,
    .fog => Icons.blur_on,
    .drizzle => Icons.grain,
    .freezingDrizzle => Icons.ac_unit,
    .rain => Icons.water_drop,
    .freezingRain => Icons.ac_unit,
    .snow => Icons.ac_unit,
    .snowGrains => Icons.ac_unit,
    .showers => Icons.cloudy_snowing,
    .snowShowers => Icons.cloudy_snowing,
    .thunderstorm => Icons.thunderstorm,
    .unknown => Icons.help_outline,
  };

  return Icon(iconData, size: iconSize);
}
