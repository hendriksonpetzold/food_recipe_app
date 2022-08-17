import 'package:get/get.dart';

class RecipeDetailController extends GetxController {
  String recipeName = Get.arguments['recipe_name'];
  List<String> ingridients = Get.arguments['ingridients'];
  String preparationMode = Get.arguments['preparation_mode'];
}
