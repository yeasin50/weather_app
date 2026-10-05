part of 'user_preference.dart';

enum TemperatureUnit {
  celsius('°C'),
  fahrenheit('°F'),
  kelvin('K');

  final String unit;

  const TemperatureUnit(this.unit);

  static double convert(double valueInCelsius, TemperatureUnit unit) {
    return switch (unit) {
      .celsius => valueInCelsius,
      .fahrenheit => (valueInCelsius * 9 / 5) + 32,
      .kelvin => valueInCelsius + 273.15,
    };
  }
}

enum PrecipitationUnit {
  millimeters('mm'),
  centimeters('cm'),
  inches('in'),
  litersPerSquareMeter('L/m²');

  final String unit;

  const PrecipitationUnit(this.unit);

  static double convert(double millimeters, PrecipitationUnit unit) {
    return switch (unit) {
      PrecipitationUnit.millimeters => millimeters,
      PrecipitationUnit.centimeters => millimeters / 10,
      PrecipitationUnit.inches => millimeters / 25.4,
      PrecipitationUnit.litersPerSquareMeter => millimeters,
    };
  }
}

enum SpeedUnit {
  meterPerSecond('m/s'),
  kilometerPerHour('km/h'),
  milesPerHour('mph'),
  knots('kn'),
  feetPerSecond('ft/s'),
  beaufort('Bft');

  final String unit;

  const SpeedUnit(this.unit);
  static double convert(double kilometerPerHour, SpeedUnit unit) {
    return switch (unit) {
      .kilometerPerHour => kilometerPerHour,
      .meterPerSecond => kilometerPerHour / 3.6,
      .milesPerHour => kilometerPerHour * 0.621371,
      .knots => kilometerPerHour * 0.539957,
      .feetPerSecond => kilometerPerHour * 0.911344,
      .beaufort => _toBeaufort(kilometerPerHour),
    };
  }

  //todo: add label for fun and show ships on  UI
  static double _toBeaufort(double kmh) {
    if (kmh < 1) return 0;
    if (kmh < 6) return 1;
    if (kmh < 12) return 2;
    if (kmh < 20) return 3;
    if (kmh < 29) return 4;
    if (kmh < 39) return 5;
    if (kmh < 50) return 6;
    if (kmh < 62) return 7;
    if (kmh < 75) return 8;
    if (kmh < 89) return 9;
    if (kmh < 103) return 10;
    if (kmh < 118) return 11;
    return 12;
  }
}

/// for visibility
enum DistanceUnit {
  meters('m'),
  kilometers('km'),
  miles('mi'),
  nauticalMiles('nmi'),
  feet('ft');

  const DistanceUnit(this.unit);

  final String unit;

  static double convert(double meters, DistanceUnit unit) {
    return switch (unit) {
      DistanceUnit.meters => meters,
      DistanceUnit.kilometers => meters / 1000,
      DistanceUnit.miles => meters * 0.000621371,
      DistanceUnit.nauticalMiles => meters * 0.000539957,
      DistanceUnit.feet => meters * 3.28084,
    };
  }
}

/// ---  metric is Standard SI
enum UnitRegion { metric, us, uk }

UserPreference _fromRegion(UnitRegion region) {
  switch (region) {
    case UnitRegion.metric:
      return UserPreference(
        tempUnit: .celsius,
        preciptationUnit: .millimeters,
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
        preciptationUnit: .millimeters,
        speedUnit: .milesPerHour,
        distanceUnit: .miles,
      );
  }
}
