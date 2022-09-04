import 'package:food_recipe_app/models/raiting_model.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class RecipeDetailController extends GetxController {
  String recipeName = Get.arguments['recipe_name'];
  List<String> ingridients = Get.arguments['ingridients'];
  String preparationMode = Get.arguments['preparation_mode'];
  DateTime preparationTime = Get.arguments['preparation_time'];
  String description = Get.arguments['description'];
  RxBool isFavorite = (Get.arguments['is_favorite'] as bool).obs;
  int id = Get.arguments['id'];
  late Box<RecipeModel> recipeBox;
  @override
  void onInit() {
    recipeBox = Hive.box('favorite');

    super.onInit();
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
          rating: RaitingModel(raiting: 5, valid: true),
          preparationTime: DateTime.parse('2020-10-21T05:00:57.258Z'),
          category: [],
          createdAt: DateTime.now(),
          description: '',
        ),
      );
    } else {
      recipeBox.delete(id);
    }
  }
}
