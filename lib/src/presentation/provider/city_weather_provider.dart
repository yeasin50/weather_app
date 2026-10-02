import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../domain/entity/weather_record.dart';
import '../../domain/weather_db.dart';
import '../common/common.dart';
import '../common/models/models.dart';
import 'city_weather_card_data_provider.dart';
import 'providers.dart';

//TODO: cache into selectedHour card data instead of looping through  every time ?
/// maintain  specific city  record and show specific hour data
/// hold 7 days data
class CityWeatherNotifier extends WeatherDataExtractor with ChangeNotifier {
  CityWeatherNotifier(this._data, this._selectedDay);
  CityWeatherRecord _data;

  DateTime _selectedDay;
  DateTime get selectedDay => _selectedDay;
  DateTime get selectedHour => _selectedDay.tilHour;

  CityRecord get city => _data.city;

  ({HourlyForecast forecast, DailyForecast dayForecast})
  get selectedHourForcast {
    final forecast = _todaysHourlyForecast.firstWhere((e) {
      return e.time.day == selectedHour.day && e.time.hour == selectedHour.hour;
    });

    final dailyData = weeklyForecast.firstWhere(
      (e) => DateUtils.isSameDay(selectedDay, e.time),
    );

    return (forecast: forecast, dayForecast: dailyData);
  }

  List<ForecastData> _mergeSunriseAndSunset(List<HourlyForecast> forecast) {
    assert(_dailyForecast.isNotEmpty);

    final List<ForecastData> items = [
      _dailyForecast.first.toSunrise,
      _dailyForecast.first.toSunset,
      _dailyForecast[1].toSunrise,
      _dailyForecast[1].toSunset, //enough
    ];

    final dailyStuff = items.where((e) {
      return !e.time.isBefore(forecast.first.time) &&
          !e.time.isAfter(forecast.last.time);
    });

    debugPrint(items.map((e) => e.time).toString());
    debugPrint(dailyStuff.map((e) => e.time).toString());

    final combinedResult = [...forecast, ...dailyStuff];
    combinedResult.sort((a, b) => a.time.compareTo(b.time));
    return combinedResult;
  }

  List<HourlyForecast> _todaysHourlyForecast = [];
  UnmodifiableListView<ForecastData> get todaysHourlyForecast {
    return UnmodifiableListView(_mergeSunriseAndSunset(_todaysHourlyForecast));
  }

  List<DailyForecast> _dailyForecast = [];
  UnmodifiableListView<DailyForecast> get weeklyForecast =>
      UnmodifiableListView(_dailyForecast);

  @override
  void updateCity(CityWeatherRecord record) {
    super.updateCity(record);
    _data = record;

    _dailyForecast = super.parseDailyForecast();
    _todaysHourlyForecast = super.parseTodaysHourlyForecast();

    notifyListeners();
  }

  void updateHour(DateTime date) {
    _selectedDay = date;
    notifyListeners();
  }

  SunInfo get sundata =>
      SunInfo(dailyForecastItems: _dailyForecast, selectedHour: selectedDay);
  MoonInfo get moonData => MoonInfo(_dailyForecast, selectedHour: selectedHour);

  HumidityDuePointData get humidityData {
    return HumidityDuePointData(
      selectedHourForcast.forecast.humadity,
      selectedHourForcast.forecast.dewPoint,
    );
  }

  PreceptionInfo get preceptionData => PreceptionInfo(
    selectedHour: selectedHour,
    hourlyData: _todaysHourlyForecast,
  );

  // ...

  WindData get wind {
    final data = selectedHourForcast.forecast;
    return WindData(windSpeed: data.wind, windDirection: data.windDirection);
  }
}
