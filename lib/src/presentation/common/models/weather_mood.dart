// import 'package:weather_app/gen/assets.gen.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';

@deprecated
enum WeatherMood { midRain, fastWind, showers, tornado }

extension WeatherMoodExtOnD on WeatherMeasurement {
  String get imagePath {
    return switch (this.value) {
      _ => "assets/images/moon_cloud_fast_rain.png",
    };
  }

  String get label {
    return switch (this) {
      _ => "Tornado",
    };
  }
}

extension WeatherMoodExt on WeatherMood {
  String get imagePath {
    return switch (this) {
      _ => "assets/images/moon_cloud_fast_rain.png",
    };
  }

  String get label {
    return switch (this) {
      WeatherMood.midRain => "Mind Rain",
      WeatherMood.fastWind => "Fast Wind",
      WeatherMood.showers => "Showers",
      WeatherMood.tornado => "Tornado",
    };
  }
}
