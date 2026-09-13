import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';
import 'package:weather_app/src/domain/weather_service.dart';

part 'metro_api_response.g.dart';
part 'metro_api_response.freezed.dart';

@freezed
abstract class MetroApiCityInfo with _$MetroApiCityInfo {
  const MetroApiCityInfo._();

  const factory MetroApiCityInfo({
    required double latitude,
    required double longitude,
    required String name,
    required String country,
    required String countryCode,
  }) = _MetroApiCityInfo;

  factory MetroApiCityInfo.fromJson(Map<String, dynamic> json) =>
      _$MetroApiCityInfoFromJson(json);

  CityInfo toDB() {
    return CityInfo(name: name, latitude: latitude, longitude: longitude);
  }
}

@freezed
class MetroApiResponse with _$MetroApiResponse {
  const MetroApiResponse._();

  const factory MetroApiResponse({
    required double latitude,
    required double longitude,
    required String timezone,
    required Map<String, String> hourlyUnits,
    required Map<String, List<dynamic>>? hourly,
    required Map<String, String> dailyUnits,
    required Map<String, List<dynamic>>? daily,
  }) = _MetroApiResponse;

  factory MetroApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MetroApiResponseFromJson(json);
}

extension MetroApiExt on MetroApiResponse {
  WeatherRecord get record => WeatherRecord(
    id: DateTime.now().millisecondsSinceEpoch,
    date: DateTime.now(), // ? 0_o
    lastUpdate: DateTime.now(),
  );

  List<DailyRecord> dailyRecords(int weatherId) {
    final List<DailyRecord> result = [];

    final times = daily?["times"];
    if (times == null || times is! List<String>) {
      throw Exception("time on daily record on should be list");
    }

    final List<DateTime> days = [];
    for (final t in times) {
      final time = DateTime.tryParse(t);
      if (time == null) throw Exception("invalid dateTime on `times`");
      days.add(time);
    }

    // well, time is first :)
    final entriesToBeRecord = (daily?.keys ?? []).skip(1).toList();
    if (entriesToBeRecord.isEmpty) return [];

    for (int i = 0; i < entriesToBeRecord.length; i++) {
      final r = entriesToBeRecord[i];
      final unit = dailyUnits[r];
      if (unit == null) {
        throw Exception("missing daily_units on daily record for $r");
      }

      DailyRecord(
        id: DateTime.now().millisecondsSinceEpoch,
        weatherId: weatherId,
        time: days[i],
        unit: unit,
        value: daily![r]![i], //xd
        type: WeatherRecordType.daily,
      );
    }

    return result;
  }

  List<DailyRecord> hourlyRecords(int weatherId) {
    final List<DailyRecord> result = [];

    final times = hourly?["times"];
    if (times == null || times is! List<String>) {
      throw Exception("time on daily record on should be list");
    }

    final List<DateTime> days = [];
    for (final t in times) {
      final time = DateTime.tryParse(t);
      if (time == null) throw Exception("invalid dateTime on `times`");
      days.add(time);
    }

    // well, time is first :)
    final entriesToBeRecord = (hourly?.keys ?? []).skip(1).toList();
    if (entriesToBeRecord.isEmpty) return [];

    for (int i = 0; i < entriesToBeRecord.length; i++) {
      final r = entriesToBeRecord[i];
      final unit = hourlyUnits[r];
      if (unit == null) {
        throw Exception("missing hourly_units on daily record for $r");
      }

      DailyRecord(
        id: DateTime.now().millisecondsSinceEpoch,
        weatherId: weatherId,
        time: days[i],
        unit: unit,
        value: hourly![r]![i], //xd
        type: WeatherRecordType.hourly,
      );
    }

    return result;
  }
}
