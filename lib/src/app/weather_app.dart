import 'dart:ui';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/src/app/theme_config.dart';
import 'package:weather_app/src/domain/weather_service.dart';
import 'package:weather_app/src/infrastructure/repository/weather_records_db.dart';

import '../domain/weather_db.dart';
import '../infrastructure/repository/weather_service_impl.dart';
import '../infrastructure/weather_provider.dart';
import 'route_config.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final isarDB = IsarWeatherDatabase.initDB();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Isar>(
      future: isarDB,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const _LoadingView();
        }
        if (snapshot.data == null) {
          return Text("gonna update ui");
        }

        return MultiProvider(
          providers: [
            Provider<IWeatherDatabase>(
              create: (_) => IsarWeatherDatabase(snapshot.data!),
            ),
            Provider<IWeatherService>(create: (_) => MetroApiServce()),
            ChangeNotifierProvider(
              create: (context) => WeatherNotifier(
                db: context.read<IWeatherDatabase>(),
                service: context.read<IWeatherService>(),
              ),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRoute.routeConfig(),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            scrollBehavior: const ScrollBehavior().copyWith(
              dragDevices: PointerDeviceKind.values.toSet(),
            ),
          ),
        );
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color.fromARGB(255, 28, 45, 74),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
