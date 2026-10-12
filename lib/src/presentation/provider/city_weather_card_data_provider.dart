import 'package:collection/collection.dart';
import '../../domain/domain.dart';
import 'providers.dart';

/// All day records of a city
class CityWeather {
  const CityWeather({
    required this.city,
    required this.sevenDaysDailyRecord,
    required this.hourlyData,
  });

  final CityRecord city;

  /// 7 days data  like sunrise,sunset etc
  final List<DailyForecast> sevenDaysDailyRecord;

  /// eachDay  data like temp, wind, uvIndex etc
  final Map<DateTime, List<HourlyForecast>> hourlyData;

  // times.removeWhere(
  //   (e) =>
  //       e.isBefore(now.tilHour) ||
  //       !e.isBefore(now.tilHour.add(const Duration(days: 1))),
  // );
}

/// it offers the daily and hourly specific data for a city
/// humidity, uvIndex, perception, sun and moon ->rise+set, wind, air quality, visibility and pressure
///
// perhaps Mixin ?
abstract class WeatherDataExtractor {
  WeatherDataExtractor();

  late CityWeatherRecord _data;
  CityWeather parseCityRecord(CityWeatherRecord record) {
    _data = record;
    return _parseWeather;
  }

  CityWeather get _parseWeather {
    final hourData = groupBy(
      _parseHourlyForecast(),
      (e) => DateTime(e.time.year, e.time.month, e.time.day),
    );

    return CityWeather(
      city: _data.city,
      sevenDaysDailyRecord: parseDailyForecast(),
      hourlyData: hourData,
    );
  }

  /// if missing returns empty
  WeatherMeasurement? _getItem(
    List<WeatherMeasurement>? items,
    MeasurementType type,
  ) {
    final result = items?.firstWhereOrNull((e) => e.measurementType == type);
    return result;
  }

  @Deprecated("use `parseWeather` instead")
  List<HourlyForecast> parseTodaysHourlyForecast() {
    return _parseHourlyForecast();
  }

  List<HourlyForecast> _parseHourlyForecast() {
    final List<HourlyForecast> result = [];

    final groupByHour = groupBy(_data.hourlyItems, (e) => e.time);
    final times = groupByHour.keys.toList();

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
        tempFeelLike: _getItem(items, .tempFeelsLike)!,
        rain: rain!,
        uvIndex: _getItem(items, .uvIndex)!,
        windspeed: _getItem(items, .windSpeed)!,
        windGusts: _getItem(items, .windGusts)!,
        windDirection: _getItem(items, .windDirection)!,
        // airQuality: _getItem(items, .airQuality)!,
        visibility: _getItem(items, .visiblity)!,
        humadity: humadity!,
        dewPoint: _getItem(items, .dewPoint)!,
        precipitationProbability: _getItem(items, .precipitationProbability)!,
      );

      result.add(forecast);
    }

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
