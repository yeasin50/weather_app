part of 'user_preference.dart';

enum TemperatureUnit { celsius, fahrenheit, kelvin }

enum PreciptationUnit { milimeters, centimeters, inches, litersPerSquareMeter }

enum SpeedUnit {
  meterePerSecond,
  kilometerPerHour,
  milesPerHour,
  knots,
  feetPerSecond,
  beaufort,
}

enum DistanceUnit { meters, kilometers, miles, nauticalMiles, feet }

/// ---  metric is Standard SI
enum UnitRegion { metric, us, uk }

UserPreference _fromRegion(UnitRegion region) {
  switch (region) {
    case UnitRegion.metric:
      return UserPreference(
        tempUnit: .celsius,
        preciptationUnit: .milimeters,
        speedUnit: .kilometerPerHour,
        distanceUnit: .kilometers,
      );

    case UnitRegion.us:
      return UserPreference(
        tempUnit: .fahrenheit,
        preciptationUnit: .inches,
        speedUnit: .milesPerHour,
        distanceUnit: .miles,
      );

    case UnitRegion.uk:
      return UserPreference(
        tempUnit: .celsius,
        preciptationUnit: .milimeters,
        speedUnit: .milesPerHour,
        distanceUnit: .miles,
      );
  }
}
