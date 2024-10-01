import 'dart:ui';

import 'package:flutter/material.dart';

import '../infrastructure/weather_repo.dart';
import 'route_config.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Future<WeatherRepo> future = WeatherRepo.init();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherRepo>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const _LoadingView();
          }
          return WeatherInheritedWidget(
            repo: snapshot.requireData,
            child: MaterialApp.router(
              routerConfig: AppRoute.routeConfig(),
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.dark,
              darkTheme: ThemeData.dark(),
              scrollBehavior: ScrollBehavior().copyWith(dragDevices: PointerDeviceKind.values.toSet()),
            ),
          );
        });
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color.fromARGB(255, 28, 45, 74),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
