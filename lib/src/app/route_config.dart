import 'package:go_router/go_router.dart';
import 'package:weather_app/src/presentation/home/home_page.dart';
import 'package:weather_app/src/presentation/saved_city/saved_city_page.dart';
import 'package:weather_app/src/presentation/search_city/search_city_page.dart';

class AppRoute {
  static const String home = '/';
  static const String savedPage = "/saved";
  static const String searchCity = "/search_city";

  static GoRouter routeConfig() {
    return GoRouter(
      initialLocation: searchCity,
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: savedPage,
          builder: (context, state) => const SavedCityPage(),
        ),
        GoRoute(
          path: searchCity,
          builder: (context, state) => const SearchCityPage(),
        ),
      ],
    );
  }
}
