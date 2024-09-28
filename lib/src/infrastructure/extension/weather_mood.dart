import 'package:weather_app/gen/assets.gen.dart';

enum WeatherMood {
  midRain,
  fastWind,
  showers,
  tornado;
}

extension WeatherMoodExt on WeatherMood {
  String get imagePath {
    return switch (this) {
      WeatherMood.midRain => Assets.images.sunCloudRain.path,
      WeatherMood.fastWind => Assets.images.moonCloudFastRain.path,
      WeatherMood.showers => Assets.images.sunCloudAngelRain.path,
      WeatherMood.tornado => Assets.images.tornado.path,
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
