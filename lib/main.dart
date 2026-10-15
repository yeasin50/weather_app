import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/weather_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const WeatherApp());
}
