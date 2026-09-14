import 'package:isar_community/isar.dart';

part 'user_preference.g.dart';

enum WeatherUnit {
  degree(0),
  celcius(1);

  const WeatherUnit(this.value);
  final short value;
}

@collection
class UserPreference {
  UserPreference({
    this.homeItemId = 0,
    this.unit = WeatherUnit.degree,
    this.updatedAt,
  }) : id = 0;

  final Id id;
  final int homeItemId;
  @Enumerated(EnumType.name)
  final WeatherUnit unit;

  DateTime? updatedAt;
}
