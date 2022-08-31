import 'package:flutter/material.dart';
import 'package:food_recipe_app/enums/bottom_bar_pages_enum.dart';
import 'package:food_recipe_app/pages/initial/components/custom_bottom_navigation_bar_icon.dart';
import 'package:food_recipe_app/pages/initial/initial_controller.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends GetView<InitialController> {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.white,
      child: Obx(
        () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationBarIcon(
                onTap: () {
                  controller.changePage(BottomBarPagesEnum.home);
                },
                icon: Icons.home,
                isSelected: controller.checkActivePage(
                  page: BottomBarPagesEnum.home,
                ),
              ),
              CustomBottomNavigationBarIcon(
                onTap: () {
                  controller.changePage(BottomBarPagesEnum.search);
                },
                icon: Icons.search,
                isSelected: controller.checkActivePage(
                  page: BottomBarPagesEnum.search,
                ),
              ),
              CustomBottomNavigationBarIcon(
                onTap: () {
                  controller.changePage(BottomBarPagesEnum.favorite);
                },
                icon: Icons.favorite,
                isSelected: controller.checkActivePage(
                  page: BottomBarPagesEnum.favorite,
                ),
              ),
              CustomBottomNavigationBarIcon(
                onTap: () {
                  controller.changePage(BottomBarPagesEnum.myRecipes);
                },
                icon: Icons.list_alt,
                isSelected: controller.checkActivePage(
                  page: BottomBarPagesEnum.myRecipes,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
