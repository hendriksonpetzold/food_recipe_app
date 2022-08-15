import 'package:food_recipe_app/pages/home/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => const HomePage()),
  ];
}
