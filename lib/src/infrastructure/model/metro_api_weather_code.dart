import 'package:flutter/material.dart' show IconData, Icons;

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

  // Not sure why  the number is exact not range
  ///! https://open-meteo.com/en/docs?timezone=Asia%2FSingapore#weather_variable_documentation
  static WeatherType fromCode(String codeStr) {
    final code = int.tryParse(codeStr);
    return switch (code) {
      null || < 0 => .unknown,
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

  String get description {
    return switch (this) {
      .clear => "Clear sky",
      .cloudy => "Mainly clear, partly cloudy, and overcast",
      .fog => "Fog and depositing rime fog",
      .drizzle => "Drizzle: Light, moderate, and dense intensity",
      .freezingDrizzle => "Freezing Drizzle: Light and dense intensity",
      .rain => "Rain: Slight, moderate and heavy intensity",
      .freezingRain => "Freezing Rain: Light and heavy intensity",
      .snow => "Snow fall: Slight, moderate, and heavy intensity",
      .snowGrains => "grains",
      .showers => "Rain showers: Slight, moderate, and violent",
      .snowShowers => "Snow showers slight and heavy",
      .thunderstorm => "Thunderstorm: Slight or moderate",
      .unknown => "Thunderstorm with slight and heavy hail",
    };
  }

  IconData get icon {
    return switch (this) {
      .clear => Icons.wb_sunny,
      .cloudy => Icons.cloud,
      .fog => Icons.blur_on,
      .drizzle => Icons.grain,
      .freezingDrizzle => Icons.ac_unit,
      .rain => Icons.water_drop,
      .freezingRain => Icons.ac_unit,
      .snow => Icons.ac_unit,
      .snowGrains => Icons.ac_unit,
      .showers => Icons.cloudy_snowing,
      .snowShowers => Icons.cloudy_snowing,
      .thunderstorm => Icons.thunderstorm,
      .unknown => Icons.help_outline,
    };
  }
}
