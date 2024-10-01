import 'package:go_router/go_router.dart';
import '../domain/domain.dart';
import '../presentation/home/home_page.dart';
import '../presentation/saved_city/saved_city_page.dart';
import '../presentation/search_city/city_weather_page.dart';
import '../presentation/search_city/search_city_page.dart';

class AppRoute {
  static const String home = '/';
  static const String savedPage = "/saved";
  static const String searchCity = "/search_city";
  static const String cityWeatherDetails = "/city_weather_info";

  static GoRouter routeConfig() {
    return GoRouter(
      initialLocation: home,
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
        GoRoute(
          path: cityWeatherDetails,
          builder: (context, state) => CityWeatherPage(
            city: state.extra as CityInfo,
            // city:
            // CityInfo(latitude: 12.3, longitude: 34.3, name: "name", country: "country", countryCode: "DB", id: 123),
          ),
        ),
      ],
    );
  }
}
