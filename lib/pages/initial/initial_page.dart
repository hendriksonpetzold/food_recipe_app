import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/favorite/favorite_page.dart';
import 'package:food_recipe_app/pages/home/home_page.dart';
import 'package:food_recipe_app/pages/initial/components/custom_bottom_navigation_bar.dart';
import 'package:food_recipe_app/pages/initial/initial_controller.dart';
import 'package:food_recipe_app/pages/my_recipes/my_recipes_page.dart';
import 'package:food_recipe_app/pages/profile/profile_page.dart';

import 'package:get/get.dart';

class InitialPage extends StatelessWidget {
  InitialPage({Key? key}) : super(key: key);
  final InitialController controller = Get.put(InitialController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
            index: controller.getPageIndex(),
            children: [
              HomePage(),
              const FavoritePage(),
              const MyRecipesPage(),
              const ProfilePage(),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
