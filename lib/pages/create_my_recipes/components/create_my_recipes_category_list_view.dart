import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_recipe_app/pages/create_my_recipes/create_my_recipes_controller.dart';
import 'package:get/get.dart';

class CreateMyRecipesCategoryListView
    extends GetView<CreateMyRecipesController> {
  const CreateMyRecipesCategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MasonryGridView.count(
        padding: const EdgeInsets.only(top: 16),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: controller.categoryNames.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final list = controller.categoryNames[index];
          return Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[400],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list,
                  style: const TextStyle(fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    controller.categoryNames.remove(list);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 16,
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
