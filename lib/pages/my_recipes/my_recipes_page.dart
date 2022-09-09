import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/show_custom_dialog.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/components/recipe_card.dart';
import 'package:food_recipe_app/pages/my_recipes/my_recipes_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyRecipesPage extends StatelessWidget {
  MyRecipesPage({Key? key}) : super(key: key);
  final MyRecipesController controller = Get.put(MyRecipesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Minhas receitas',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.myRecipesBox.listenable(),
        builder: (context, Box<RecipeModel> box, _) {
          List<RecipeModel> recipe = box.values.toList().cast<RecipeModel>();
          return ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: recipe.length,
            itemBuilder: (context, index) {
              final list = recipe[index];
              return Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/initial_page/recipe_detail_page',
                          arguments: {
                            'recipe_name': list.recipeName,
                            'ingridients': list.ingridients,
                            'preparation_mode': list.preparationMode,
                            'is_favorite': false,
                            'id': list.id,
                            'description': list.description,
                            'preparation_time': list.preparationTime,
                            'rating': list.rating,
                            'categories': list.category,
                            'page': 'my_recipes',
                          },
                        );
                      },
                      child: RecipeCard(
                        recipeName: list.recipeName,
                        suffix: GestureDetector(
                          onTap: () {
                            showCustomDialog(
                              context,
                              onConfirmButtonTap: () {
                                controller.deleteRecipe(list.recipeName);
                                Get.back();
                              },
                            );
                          },
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accentColor,
        onPressed: () {
          Get.toNamed('/initial_page/create_my_recipes_page');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
