import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/recipe_detail/components/ingridients_list_view.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          backgroundColor: AppColors.backGroundColor,
          title: const Text(
            'Nome da receita',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: const [
            SizedBox(
              height: 16,
            ),
            TabBar(
              indicatorColor: AppColors.accentColor,
              tabs: [
                Text(
                  'Ingredientes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Modo de preparo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  IngridientsListView(),
                  Center(
                    child: Text(
                      'Page2',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
