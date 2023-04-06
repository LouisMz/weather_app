import 'package:get/get.dart';
import 'package:weather_app/dashboard/dashboard_screen.dart';
import 'package:weather_app/screens/searchWeather/search_weather.dart';

part 'routes_constants.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HomeViewRoute,
        page: () {
          return DashboardScreen();
        }),
    GetPage(
        name: Routes.SearchWeatherViewRoute,
        page: () {
          return const SearchWeather();
        }),
    GetPage(
        name: Routes.HomeViewRoute,
        page: () {
          return DashboardScreen();
        })
  ];
}
