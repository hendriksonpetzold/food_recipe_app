import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/app_button.dart';
import 'package:food_recipe_app/pages/create_my_recipes/components/create_my_recipes_text_form_field.dart';
import 'package:food_recipe_app/pages/create_my_recipes/create_my_recipes_controller.dart';

import 'package:food_recipe_app/style/app_colors.dart';
import 'package:get/get.dart';

class CreateMyRecipesPage extends StatelessWidget {
  CreateMyRecipesPage({Key? key}) : super(key: key);
  final CreateMyRecipesController controller =
      Get.put(CreateMyRecipesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: const Text(
          'Crie a sua receita',
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        leading: BackButton(
          color: AppColors.textColor,
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              CreateMyRecipesTextFormField(
                label: 'Nome da receita',
                controller: controller.nameEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              CreateMyRecipesTextFormField(
                label: 'Ingredientes',
                controller: controller.ingredientsEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              CreateMyRecipesTextFormField(
                label: 'Descrição',
                controller: controller.descriptionEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              CreateMyRecipesTextFormField(
                label: 'Modo de preparo',
                controller: controller.preparationModeEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              CreateMyRecipesTextFormField(
                label: 'Tempo para preparo',
                controller: controller.preparationTimeEditingController,
              ),
              const SizedBox(
                height: 8,
              ),
              CreateMyRecipesTextFormField(
                label: 'Categoria',
                controller: controller.categoryEditingController,
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                label: 'Criar receita',
                onTap: () {
                  controller.onCreateRecipeButtonTap();
                  Get.back();
                },
                isSelected: RxBool(true),
                circularBorder: 20,
                margin: EdgeInsets.zero,
              )
            ],
          ),
        ),
      ),
    );
  }
}
