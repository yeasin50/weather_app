import '../../domain/domain.dart';

import '../model/hourly_weather_info.dart';

extension MetroApiResponseExt on MetroApiResponse {
  /// current hour data
  HourlyWeatherInfo? getCurrentHourWeather(DateTime date) {
    int? hourIndex = hourlyData?.time.indexWhere((e) => e.day == date.day && e.hour == date.hour);

    if (hourIndex == null || hourIndex < 0) return null;

    return HourlyWeatherInfo(
      date: date,
      humidity: hourlyData!.humidity.elementAt(hourIndex),
      rain: hourlyData!.rain.elementAt(hourIndex),
      temperature: hourlyData!.temp.elementAt(hourIndex),
    );
  }

  List<HourlyWeatherInfo> get todaysHourlyForecast {
    final today = DateTime.now();

    final result = List.generate(24, (index) {
      final date = today.copyWith(hour: index);
      return getCurrentHourWeather(date) ?? HourlyWeatherInfo.none;
    });

    return result;
  }

  List<HourlyWeatherInfo> get weeklyForecast {
    if (hourlyData == null) return [];

    assert(hourlyData!.time.isNotEmpty, "time can't be empty for weeklyForecast");

    /// <day, data>
    final Map<int, HourlyWeatherInfo> result = {};

    for (int i = 0; i < hourlyData!.time.length; i++) {
      final data = HourlyWeatherInfo(
        date: hourlyData!.time[i],
        temperature: hourlyData!.temp[i],
        humidity: hourlyData!.humidity[i],
        rain: hourlyData!.rain[i],
      );

      final day = hourlyData!.time[i].day;
      if (result.containsKey(day)) {
        result[day] = result[day]! + data;
      } else {
        result.putIfAbsent(day, () => data);
      }
    }

    return result.values
        .map(
          (e) => e.copyWith(
            humidity: e.humidity ~/ 24,
            rain: e.rain / 24,
            temperature: e.temperature / 24,
          ),
        )
        .toList();
  }
}
