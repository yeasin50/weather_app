import 'package:isar/isar.dart';

part 'user_preference.g.dart';

enum WeatherUnit { degree, celcius }

@collection
class UserPreference {
  const UserPreference({this.homeItemId = 0, this.unit = WeatherUnit.degree})
    : id = 0;

  final int id;
  final int homeItemId;
  final WeatherUnit unit;
}
