import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/home/home_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      scrollBehavior: ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
      }),
      home: HomePage(),
    );
  }
}
