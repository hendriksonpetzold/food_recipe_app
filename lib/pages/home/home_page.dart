import 'package:flutter/material.dart';

import 'package:food_recipe_app/pages/home/components/home_recipe_list_view.dart';

import 'package:food_recipe_app/pages/home/components/home_select_recipe_type.dart';
import 'package:food_recipe_app/pages/home/home_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Menu de receitas',
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 16,
            ),
            Text(
              'Selecione por categoria',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            HomeSelectRecipeTypeBar(),
            SizedBox(
              height: 16,
            ),
            HomeRecipeListView(),
          ],
        ),
      ),
    );
  }
}
