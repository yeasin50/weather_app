import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:provider/provider.dart';

import '/src/app/theme_config.dart';
import '/src/domain/weather_service.dart';
import '/src/infrastructure/repository/weather_records_db.dart';
import '../presentation/provider/providers.dart';
import '../domain/weather_db.dart';
import '../infrastructure/repository/weather_service_impl.dart';
import '../presentation/provider/weather_provider.dart';
import 'route_config.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final isarDB =
      IsarWeatherDatabase.initDB(); //TODO: centralize all initial loading
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Isar>(
      future: isarDB,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const _LoadingView();
        }
        if (snapshot.data == null) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Material(
              child: Center(child: Text("gonna update ui\n ${snapshot.error}")),
            ),
          );
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
              )..loadData(),
            ),

            ChangeNotifierProxyProvider<WeatherNotifier, CityWeatherNotifier>(
              create: (_) =>
                  CityWeatherNotifier(CityWeatherRecord.none, DateTime.now()),
              update: (_, weather, cityNotifier) {
                cityNotifier!.updateCity(weather.activeCity ?? .none);
                return cityNotifier;
              },
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRoute.routeConfig(),
            debugShowCheckedModeBanner: false,
            theme: AppTheme
                .theme, //TODO: use provider and dynamic from  system schema
            themeMode: AppTheme.mode,
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
