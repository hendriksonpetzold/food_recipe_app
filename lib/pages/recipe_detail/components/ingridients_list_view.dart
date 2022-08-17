import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/recipe_detail/recipe_detail_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class IngridientsListView extends GetView<RecipeDetailController> {
  const IngridientsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.ingridients.length,
      itemBuilder: (context, index) {
        final list = controller.ingridients[index];
        return ListTile(
          leading: const Icon(
            Icons.horizontal_rule,
            color: AppColors.accentColor,
          ),
          title: Text(list),
        );
      },
    );
  }
}
