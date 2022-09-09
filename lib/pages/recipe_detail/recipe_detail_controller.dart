import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/rating_model.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/repository/repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class RecipeDetailController extends GetxController {
  String recipeName = Get.arguments['recipe_name'];
  List<String> ingridients = Get.arguments['ingridients'];
  String preparationMode = Get.arguments['preparation_mode'];
  DateTime preparationTime = Get.arguments['preparation_time'];
  String description = Get.arguments['description'];
  RatingModel rating = Get.arguments['rating'] as RatingModel;
  List<String> categories = Get.arguments['categories'];
  RxBool isFavorite = (Get.arguments['is_favorite'] as bool).obs;
  String page = Get.arguments['page'];

  int id = Get.arguments['id'];
  RxBool isVisible = RxBool(false);

  late Box<RecipeModel> recipeBox;
  Repository repository = Repository();
  @override
  void onInit() async {
    recipeBox = Hive.box('favorite');

    isPostButtonVisible();
    super.onInit();
  }

  void isPostButtonVisible() {
    if (page == 'my_recipes') {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
  }

  Future<void> postRecipe() async {
    try {
      await repository.postRecipe({
        "name": recipeName,
        "description": description,
        "prepare_method": preparationMode,
        "ingredients": ingridients,
        "categories": categories,
        "preparation_time": preparationTime.toUtc().toIso8601String(),
      });
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Receita compartilhada com sucesso'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Error ao compartilhar receita'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void onFavoriteButtonTap() {
    if (isFavorite.value == false) {
      isFavorite.value = true;
    } else {
      isFavorite.value = false;
    }
    if (isFavorite.value == true) {
      recipeBox.put(
        id,
        RecipeModel(
          recipeName: recipeName,
          preparationMode: preparationMode,
          ingridients: ingridients,
          id: id,
          isFavorite: isFavorite.value,
          rating: rating,
          preparationTime: preparationTime,
          category: categories,
          createdAt: DateTime.now(),
          description: description,
        ),
      );
    } else {
      recipeBox.delete(id);
    }
  }
}
