import 'package:isar_community/isar.dart';

part 'units.dart';
part 'user_preference.g.dart';

//NOTE:  nothing to do  with domain  or db layer, we gonna convert before showing on UI layer
@collection
class UserPreference {
  UserPreference({
    this.homeItemId = 0,
    this.updatedAt,
    required this.tempUnit,
    required this.preciptationUnit,
    required this.speedUnit,
    required this.distanceUnit,
    this.language = "system", //TODO: will handle later
    this.theme = "dark",
    this.iconPack = "default",
  }) : id = 0;

  factory UserPreference.fromMetric(UnitRegion region) => _fromRegion(region);

  final Id id;

  int homeItemId; //required?
  @Enumerated(.name)
  TemperatureUnit tempUnit;
  @Enumerated(.name)
  PreciptationUnit preciptationUnit;

  @Enumerated(.name)
  SpeedUnit speedUnit;

  @Enumerated(.name)
  DistanceUnit distanceUnit;

  final String language;
  final String theme;
  final String iconPack;

  DateTime? updatedAt;

  UserPreference copyWith({
    TemperatureUnit? tempUnit,
    PreciptationUnit? preciptationUnit,
    SpeedUnit? speedUnit,
    DistanceUnit? distanceUnit,
  }) {
    return UserPreference(
      tempUnit: tempUnit ?? this.tempUnit,
      preciptationUnit: preciptationUnit ?? this.preciptationUnit,
      speedUnit: speedUnit ?? this.speedUnit,
      distanceUnit: distanceUnit ?? this.distanceUnit,
    );
  }
}
