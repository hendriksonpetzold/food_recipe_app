import 'package:food_recipe_app/pages/initial/initial_page.dart';
import 'package:food_recipe_app/pages/on_boarding/on_boarding_page.dart';
import 'package:food_recipe_app/pages/recipe_detail/recipe_detail_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => const OnBoardingPage()),
    GetPage(
      name: '/initial_page',
      page: () => InitialPage(),
      children: [
        GetPage(
          name: '/recipe_detail_page',
          page: () => RecipeDetailPage(),
        ),
      ],
    ),
  ];
}
