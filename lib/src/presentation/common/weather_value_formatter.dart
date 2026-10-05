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

  static String temp(double value, [int fractionDigits = 0]) {
    return "${value.toStringAsFixed(fractionDigits)}\u00B0";
  }

  static String wind(double value, [int fractionDigits = 0]) {
    //TODO: converter
    return "${value.toStringAsFixed(fractionDigits)}";
  }

  double tempValue(double celcius) {
    return TemperatureUnit.convert(celcius, _preference.tempUnit);
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
}
