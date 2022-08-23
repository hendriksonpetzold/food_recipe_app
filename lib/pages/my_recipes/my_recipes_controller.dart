import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MyRecipesController extends GetxController {
  late Box<RecipeModel> myRecipesBox;

  @override
  void onInit() {
    myRecipesBox = Hive.box('my_recipes');

    super.onInit();
  }
}
