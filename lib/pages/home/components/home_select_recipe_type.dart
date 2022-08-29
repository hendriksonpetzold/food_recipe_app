import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';
import 'package:food_recipe_app/enums/recipe_type_enum.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeSelectMovieTypeBar extends GetView<HomeController> {
  const HomeSelectMovieTypeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 50,
        width: 940,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.category.length,
          itemBuilder: (context, index) {
            final list = controller.category[index];
            RecipeTypeEnum listEnum = controller.selectEnum(index);
            return Obx(
              () {
                return AppButton(
                  label: list.name,
                  onTap: () {
                    controller.changeList(list: listEnum);
                    controller.getListByFoodType();
                  },
                  isSelected: controller.checkActiveList(list: listEnum),
                  height: 50,
                  width: 140,
                );
              },
            );
          },
        ),
      );
    });
  }
}
