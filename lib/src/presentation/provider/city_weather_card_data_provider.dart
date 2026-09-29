import 'package:collection/collection.dart';
import '../../domain/domain.dart';
import '../common/common.dart' show DateExtention;
import 'providers.dart';

/// it offers the daily and hourly specific data for a city
/// humidity, uvIndex, perception, sun and moon ->rise+set, wind, air quality, visibility and pressure
abstract class WeatherDataExtractor {
  WeatherDataExtractor();

  late CityWeatherRecord _data;
  void updateCity(CityWeatherRecord record) => _data = record;

  /// if missing returns empty
  WeatherMeasurement? _getItem(
    List<WeatherMeasurement>? items,
    MeasurementType type,
  ) {
    final result = items?.firstWhereOrNull((e) => e.measurementType == type);
    return result;
  }

  List<HourlyForecast> parseTodaysHourlyForecast() {
    final List<HourlyForecast> result = [];

    final now = DateTime.now();

    final groupByHour = groupBy(_data.hourlyItems, (e) => e.time);
    final times = groupByHour.keys.toList();
    times.removeWhere(
      (e) =>
          e.isBefore(now.tilHour) ||
          !e.isBefore(now.tilHour.add(const Duration(days: 1))),
    );

    for (final t in times) {
      final items = groupByHour[t];
      final weatherCode = _getItem(items, .weatherCode);
      final temp = _getItem(items, .temperature);
      final rain = _getItem(items, .rain);
      final humadity = _getItem(items, .relativeHumidity);

      assert(
        [weatherCode, temp, rain, humadity].every((e) => e != null),
        'temp:${temp != null} rain:${rain != null} humadity:${humadity != null}',
      );

      final forecast = HourlyForecast(
        time: t,
        weatherCode: weatherCode!,
        temp: temp!,
        rain: rain!,
        uvIndex: _getItem(items, .uvIndex)!,
        wind: _getItem(items, .windSpeed)!,
        // airQuality: _getItem(items, .airQuality)!,
        // visibility: _getItem(items, .visiblity)!,
        humadity: humadity!,
        precipitationProbability: _getItem(items, .precipitationProbability)!,
      );

      result.add(forecast);
    }

    if (result.isNotEmpty) result[0] = result[0].updateSelected(true);

    return result;
  }

  List<DailyForecast> parseDailyForecast() {
    final List<DailyForecast> result = [];

    final groupByHour = groupBy(_data.dailyItems, (e) => e.time);
    final times = groupByHour.keys.toList();

    for (final t in times) {
      final items = groupByHour[t];
      final tempMax = _getItem(items, .temperatureMax);
      final tempMin = _getItem(items, .temperatureMin);
      final rain = _getItem(items, .precipitationProbability);
      final weatherCode = _getItem(items, .weatherCode);
      final sunrise = _getItem(items, .sunrise);
      final sunset = _getItem(items, .sunset);

      assert(
        [tempMin, tempMax, rain, weatherCode].every((e) => e != null),
        'tempMin:${tempMin != null}  tempMax:${tempMax != null} rain:${rain != null}',
      );

      result.add(
        DailyForecast(
          time: t,
          tempMin: tempMin!,
          tempMax: tempMax!,
          rain: rain!,
          weatherCode: weatherCode!,
          sunrise: sunrise!,
          sunset: sunset!,
          moonPhase: _getItem(items, .moonPhase)!,
          moonRise: _getItem(items, .moonRise) ?? WeatherMeasurement.emptyW,
          moonSet: _getItem(items, .moonSet) ?? WeatherMeasurement.emptyW,
        ),
      );
    }

    return result;
  }
}
