import '../../domain/domain.dart';
import 'weather_mood.dart';

import '../model/hourly_weather_info.dart';

extension MetroApiResponseExt on MetroApiResponse {
  /// current hour data
  HourlyWeatherInfo? getWeather(DateTime date) {
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

    final result = List.generate(
      24,
      (index) => getWeather(today..copyWith(hour: index)) ?? HourlyWeatherInfo.none,
    );

    return result;
  }

  List<HourlyWeatherInfo> get weeklyForecast {
    if (hourlyData != null) return [];

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
        result[day] = data;
      }
    }
    return result.values.toList();
  }
}
