import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';
import 'package:food_recipe_app/enums/recipe_type_enum.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeSelectMovieTypeBar extends GetView<HomeController> {
  const HomeSelectMovieTypeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 50,
        width: 1100,
        child: Obx(
          () {
            return Row(
              children: [
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.all);
                    controller.getListByGenre();
                  },
                  label: 'All',
                  isSelected:
                      controller.checkActiveList(list: RecipeTypeEnum.all),
                  height: 50,
                  width: 60,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.breakFast);
                    controller.getListByGenre();
                  },
                  label: 'Café da manhã',
                  isSelected: controller.checkActiveList(
                      list: RecipeTypeEnum.breakFast),
                  height: 50,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.lunch);
                    controller.getListByGenre();
                  },
                  label: 'Almoço',
                  isSelected:
                      controller.checkActiveList(list: RecipeTypeEnum.lunch),
                  height: 50,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.dinner);
                    controller.getListByGenre();
                  },
                  label: 'Jantar',
                  isSelected:
                      controller.checkActiveList(list: RecipeTypeEnum.dinner),
                  height: 50,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.japaneseFood);
                    controller.getListByGenre();
                  },
                  label: 'Japonesa',
                  isSelected: controller.checkActiveList(
                      list: RecipeTypeEnum.japaneseFood),
                  height: 50,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.italyFood);
                    controller.getListByGenre();
                  },
                  label: 'Italiana',
                  isSelected: controller.checkActiveList(
                      list: RecipeTypeEnum.italyFood),
                  height: 50,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: RecipeTypeEnum.sweet);
                    controller.getListByGenre();
                  },
                  label: 'Sobremesas',
                  isSelected:
                      controller.checkActiveList(list: RecipeTypeEnum.sweet),
                  height: 50,
                  width: 140,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
