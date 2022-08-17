import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/home/components/home_recipe_card.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeRecipeListView extends GetView<HomeController> {
  const HomeRecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.recipe.length,
        itemBuilder: (context, index) {
          final list = controller.recipe[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    '/initial_page/recipe_detail_page',
                    arguments: {
                      'recipe_name': list.recipeName,
                      'ingridients': list.ingridients,
                      'preparation_mode': list.preparationMode,
                    },
                  );
                },
                child: HomeRecipeCard(
                  recipeName: list.recipeName,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}
