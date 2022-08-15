import 'package:food_recipe_app/pages/home/home_page.dart';
import 'package:food_recipe_app/pages/on_boarding/on_boarding_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => const OnBoardingPage()),
    GetPage(name: '/home_page', page: () => const HomePage()),
  ];
}
