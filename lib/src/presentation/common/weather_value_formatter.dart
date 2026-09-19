import '../../domain/domain.dart';

extension WeatherValueFormatter on WeatherMeasurement {
  String get formatValue =>
      measurementType == .weatherCode ? "mood" : _valueFormatter(this);
}

String _valueFormatter(WeatherMeasurement data) {
  return switch (data.measurementType) {
    ///? Should I show int instead of decimal .....
    .temperature || .temperatureMax || .temperatureMin => "${data.value}\u00B0",
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
