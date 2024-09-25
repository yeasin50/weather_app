import 'dart:ui';

import 'package:flutter/material.dart';

import 'route_config.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.routeConfig(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      scrollBehavior: ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
      }),
    );
  }
}
