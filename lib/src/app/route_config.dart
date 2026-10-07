import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/home/empty_city_view.dart';
import '../presentation/home/sun_moon_details_page.dart';
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

  static const String empyCity = "/empty_city";
  static const String initLoadingPage = "/init_page";

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const sunMoonRisePage = "/sun_moom_rise_set";
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routeConfig(WeatherNotifier weather) {
    return GoRouter(
      initialLocation: home,
      navigatorKey: _rootNavigatorKey,
      refreshListenable: weather,
      redirect: (context, state) {
        if (weather.isloading && state.matchedLocation != initLoadingPage) {
          return initLoadingPage;
        }

        if (!weather.isloading && state.matchedLocation == initLoadingPage) {
          return home;
        }

        return null;
      },
      routes: [
        GoRoute(path: empyCity, builder: (context, state) => EmptyCityView()),
        GoRoute(
          path: initLoadingPage,
          builder: (context, state) =>
              Center(child: CircularProgressIndicator()),
        ),
        GoRoute(path: home, builder: (context, state) => const HomePage()),
        GoRoute(path: savedPage, builder: (context, state) => SavedCityPage()),
        GoRoute(
          path: searchCity,
          builder: (context, state) => const SearchCityPage(),
        ),

        ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          navigatorKey: _shellNavigatorKey,
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

        ShellRoute(
          //TODO: prep  and perform
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, child) => Theme(
            data: Theme.of(context).copyWith(
              appBarTheme: const AppBarTheme(
                // backgroundColor: Colors.transparent,
              ),
            ),
            child: child,
          ),

          routes: [
            GoRoute(
              path: sunMoonRisePage,
              builder: (context, state) => SunMoonDetailsPage(),
            ),
          ],
        ),
      ],
    );
  }
}
