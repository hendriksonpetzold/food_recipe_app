import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box<RecipeModel> recipeBox;

  @override
  void onInit() {
    recipeBox = Hive.box('favorite');

    super.onInit();
  }
}
