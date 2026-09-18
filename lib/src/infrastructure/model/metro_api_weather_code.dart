enum WeatherType {
  clear,
  cloudy,
  fog,
  drizzle,
  freezingDrizzle,
  rain,
  freezingRain,
  snow,
  snowGrains,
  showers,
  snowShowers,
  thunderstorm,
  unknown;

  /// NOTE: WHY  ISAR generate fails with .shorthand
  // Not sure why  the number is exact not range
  ///! https://open-meteo.com/en/docs?timezone=Asia%2FSingapore#weather_variable_documentation
  static WeatherType fromCode(int code) {
    return switch (code) {
      < 0 => .unknown,
      0 => .clear,
      < 4 => .cloudy,
      45 || 48 => .fog,
      51 || 53 || 55 => .drizzle,
      56 || 57 => .freezingDrizzle,
      61 || 63 || 65 => .rain,
      66 || 67 => .freezingRain,
      71 || 73 || 75 => .snow,
      77 => .snowGrains,
      80 || 81 || 82 => .showers,
      85 || 86 => .snowShowers,
      95 || 96 || 99 => .thunderstorm,
      _ => .unknown,
    };
  }
}
