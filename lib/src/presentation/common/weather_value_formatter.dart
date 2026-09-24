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
