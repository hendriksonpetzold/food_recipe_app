import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/pages/home/components/home_recipe_card.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends GetView<HomeController> {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Meus favoritos',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.recipeBox.listenable(),
        builder: (context, Box<RecipeModel> box, _) {
          List<RecipeModel> recipe = box.values.toList().cast<RecipeModel>();
          return ListView.builder(
            itemCount: recipe.length,
            itemBuilder: (context, index) {
              final list = recipe[index];
              return HomeRecipeCard(
                recipeName: list.recipeName,
                isFavorite: RxBool(false),
                onFavoriteButtonTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
