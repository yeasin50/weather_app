import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../presentation/settings/appearance_setting.dart';
import '../presentation/settings/settings.dart' show SettingPage;
import '/src/presentation/provider/weather_provider.dart';

import '../presentation/home/home_page.dart';
import '../presentation/saved_city/saved_city_page.dart';
import '../presentation/search_city/search_city_page.dart';

class AppRoute {
  static const String home = '/';

  @deprecated
  static const String savedPage = "/saved";
  static const String searchCity = "/search_city";
  static const String cityWeatherDetails = "/city_weather_info";

  static const String setting = "/setting";
  static const String appearance = "/setting/appearance";

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routeConfig() {
    return GoRouter(
      initialLocation: home,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) =>
              context
                  .watch<WeatherNotifier>()
                  .isloading // I  might gonna put on single initial loading
              ? Center(child: CircularProgressIndicator())
              : const HomePage(),
        ),
        GoRoute(path: savedPage, builder: (context, state) => SavedCityPage()),
        GoRoute(
          path: searchCity,
          builder: (context, state) => const SearchCityPage(),
        ),

        ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, child) => Theme(
            data: Theme.of(context).copyWith(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
              ),
            ),
            child: child,
          ),
          routes: [
            GoRoute(
              path: setting,
              builder: (context, state) => const SettingPage(),
              routes: [
                GoRoute(
                  path: appearance.split('/').last,
                  builder: (context, state) => AppearanceSetting(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
