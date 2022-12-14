import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/recipe_card.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeRecipeListView extends GetView<HomeController> {
  const HomeRecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Obx(() {
      return SmartRefresher(
        controller: controller.refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await controller.getListByFoodType(isRefresh: true);
          if (result == true) {
            controller.refreshController.refreshCompleted();
          } else {
            controller.refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await controller.getListByFoodType();
          if (result == true) {
            controller.refreshController.loadComplete();
          } else {
            controller.refreshController.loadFailed();
          }
        },
        child: ListView.builder(
          itemCount: controller.recipe.length,
          itemBuilder: (context, index) {
            final list = controller.recipe[index];

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    final box = controller.recipeBox.get(list.id);

                    Get.toNamed(
                      '/initial_page/recipe_detail_page',
                      arguments: {
                        'recipe_name': list.recipeName,
                        'ingridients': list.ingridients,
                        'preparation_mode': list.preparationMode,
                        'is_favorite': box?.isFavorite ?? false,
                        'id': list.id,
                        'description': list.description,
                        'preparation_time': list.preparationTime,
                        'rating': list.rating,
                        'categories': list.category,
                        'page': 'home',
                      },
                    );
                  },
                  child: RecipeCard(
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
    }));
  }
}
