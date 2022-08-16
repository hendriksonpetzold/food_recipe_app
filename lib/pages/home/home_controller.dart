import 'package:flutter/cupertino.dart';
import 'package:food_recipe_app/enums/recipe_type_enum.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController searchEditingController = TextEditingController();
  final Rx<RecipeTypeEnum> _activeList = Rx<RecipeTypeEnum>(RecipeTypeEnum.all);
  RecipeTypeEnum get activeList => _activeList.value;
  void changeList({required RecipeTypeEnum list}) {
    _activeList.value = list;
  }

  RxBool checkActiveList({required RecipeTypeEnum list}) {
    if (list == _activeList.value) return RxBool(true);
    return RxBool(false);
  }

  void getListByGenre() {
    switch (_activeList.value) {
      case RecipeTypeEnum.all:
        break;
      case RecipeTypeEnum.sweet:
        break;

      case RecipeTypeEnum.breakFast:
        break;

      case RecipeTypeEnum.dinner:
        break;

      case RecipeTypeEnum.italyFood:
        break;

      case RecipeTypeEnum.lunch:
        break;

      case RecipeTypeEnum.japaneseFood:
        break;
      default:
    }
  }
}
