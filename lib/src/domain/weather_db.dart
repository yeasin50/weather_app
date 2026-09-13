import 'entity/user_preference.dart';
import 'entity/weather_record.dart';

abstract class IWeatherDatabase {
  const IWeatherDatabase();
  static int primaryHomeWeatherId = 0;

  Future<WeatherRecord> saveRecord(WeatherRecord record);
  Future<List<WeatherRecord>> getRecords();
  Future<bool> deleteRecord(WeatherRecord record);

  Future<UserPreference> updatePreference(UserPreference pref);
  Future<UserPreference> getPreference();
}
