import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CreateMyRecipesController extends GetxController {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ingredientsEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController preparationModeEditingController =
      TextEditingController();
  TextEditingController preparationTimeEditingController =
      TextEditingController();
  TextEditingController categoryEditingController = TextEditingController();

  late Box<RecipeModel> myRecipesBox;

  @override
  void onInit() {
    myRecipesBox = Hive.box('my_recipes');

    super.onInit();
  }

  void onCreateRecipeButtonTap() {
    myRecipesBox.add(
      RecipeModel(
        id: 2,
        recipeName: nameEditingController.text,
        preparationMode: preparationModeEditingController.text,
        ingridients: [],
        category: [],
        description: descriptionEditingController.text,
        preparationTime: double.parse(preparationTimeEditingController.text),
        rating: 5,
        createdAt: 6,
        isFavorite: false,
      ),
    );
  }
}
