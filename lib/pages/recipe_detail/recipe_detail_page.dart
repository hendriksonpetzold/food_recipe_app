import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';

import 'package:food_recipe_app/components/favorite_button.dart';
import 'package:food_recipe_app/pages/recipe_detail/components/ingridients_list_view.dart';

import 'package:food_recipe_app/pages/recipe_detail/recipe_detail_controller.dart';
import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class RecipeDetailPage extends StatelessWidget {
  RecipeDetailPage({Key? key}) : super(key: key);

  final RecipeDetailController controller = Get.put(RecipeDetailController());

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
          title: Text(
            controller.recipeName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            FavoriteButton(
              isFavorite: controller.isFavorite,
              onFavoriteButtonTap: () {
                controller.onFavoriteButtonTap();
              },
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const Text(
                  'Descrição',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const Text(
                  'Tempo para preparo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${controller.preparationTime.hour} horas e ${controller.preparationTime.minute} minutos',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TabBar(
                indicatorColor: AppColors.accentColor,
                tabs: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: const Text(
                      'Ingredientes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: const Text(
                      'Modo de preparo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const IngridientsListView(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.preparationMode,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: controller.isVisible.value,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                      left: 32,
                      right: 32,
                      top: 16,
                    ),
                    child: AppButton(
                      height: 50,
                      label: 'Compartilhe sua receita',
                      onTap: () {
                        controller.postRecipe();
                      },
                      margin: EdgeInsets.zero,
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
