import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';
import 'package:food_recipe_app/enums/recipe_type_enum.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeSelectMovieTypeBar extends GetView<HomeController> {
  const HomeSelectMovieTypeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.category.length + 1,
        itemBuilder: (context, index) {
          return Obx(
            () {
              if (index == 0) {
                return AppButton(
                  label: 'Início',
                  onTap: () {
                    controller.changeList(enumValue: RecipeTypeEnum.all);
                    controller.getListByFoodType(isRefresh: true);
                  },
                  isSelected:
                      controller.checkActiveList(enumValue: RecipeTypeEnum.all),
                  height: 50,
                  width: 140,
                );
              } else {
                RecipeTypeEnum listEnum = controller.selectEnum(index - 1);
                final list = controller.category[index - 1];
                return AppButton(
                  label: list,
                  onTap: () {
                    controller.changeList(enumValue: listEnum);
                    controller.getListByFoodType(isRefresh: true);
                  },
                  isSelected: controller.checkActiveList(enumValue: listEnum),
                  height: 50,
                  width: 140,
                );
              }
            },
          );
        },
      ),
    );
  }
}
