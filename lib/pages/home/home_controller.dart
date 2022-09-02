import 'package:flutter/cupertino.dart';
import 'package:food_recipe_app/enums/recipe_type_enum.dart';

import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/repository/repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  Repository repository = Repository();
  final TextEditingController searchEditingController = TextEditingController();
  final Rx<RecipeTypeEnum> _activeList = Rx<RecipeTypeEnum>(RecipeTypeEnum.all);
  RecipeTypeEnum get activeList => _activeList.value;
  RefreshController refreshController = RefreshController(initialRefresh: true);
  late Box<RecipeModel> recipeBox;

  RxList<RecipeModel> recipe = RxList([]);
  int currentPage = 1;
  List<String> category = [
    'Bolos',
    'Carnes',
    'Doces',
    'Espanhola',
    'Massas',
    'Sobremesas'
  ];

  @override
  void onInit() async {
    recipeBox = Hive.box('all_favorite');

    super.onInit();
  }

  Future<bool> fetchRecipes({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }
    final result = await repository.findRecipes(page: currentPage);

    if (result.isEmpty) {
      return false;
    } else {
      if (isRefresh) {
        recipe.value = result;
      } else {
        recipe.addAll(result);
      }
      currentPage++;

      return true;
    }
  }

  RecipeTypeEnum selectEnum(int index) {
    final list = category[index];
    switch (list) {
      case 'Bolos':
        return RecipeTypeEnum.cakes;

      case 'Carnes':
        return RecipeTypeEnum.meat;

      case 'Doces':
        return RecipeTypeEnum.sweet;

      case 'Espanhola':
        return RecipeTypeEnum.spanish;

      case 'Massas':
        return RecipeTypeEnum.pasta;

      case 'Sobremesas':
        return RecipeTypeEnum.desserts;

      default:
        return RecipeTypeEnum.all;
    }
  }

  void changeList({required RecipeTypeEnum enumValue}) {
    _activeList.value = enumValue;
  }

  RxBool checkActiveList({required RecipeTypeEnum enumValue}) {
    if (enumValue == _activeList.value) return RxBool(true);
    return RxBool(false);
  }

  void getListByFoodType() {
    switch (_activeList.value) {
      case RecipeTypeEnum.all:

      case RecipeTypeEnum.cakes:

      case RecipeTypeEnum.meat:

      case RecipeTypeEnum.sweet:

      case RecipeTypeEnum.pasta:

      case RecipeTypeEnum.desserts:

      case RecipeTypeEnum.spanish:

      default:
    }
  }
}
