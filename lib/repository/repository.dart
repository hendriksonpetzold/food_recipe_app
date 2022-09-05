import 'package:food_recipe_app/models/category_model.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/services/custom_dio/custom_dio.dart';

class Repository {
  CustomDio dio = CustomDio();
  final String _url = const String.fromEnvironment('url');
  Future<List<CategoryModel>> findAllCategories() async {
    final response = await dio.get('$_url/category');
    final result = response.data as List;

    return result.map<CategoryModel>((e) {
      return CategoryModel.fromMap(e);
    }).toList();
  }

  Future<List<RecipeModel>> findRecipes({required int page}) async {
    final response = await dio.get('$_url/recipe?page_id=$page&page_size=10');

    final result = response.data as List;
    return result.map<RecipeModel>((e) {
      return RecipeModel.fromMap(e);
    }).toList();
  }

  Future<List<RecipeModel>> findRecipesByCategory(
      {required int page, required List<String> categories}) async {
    final response = await dio.get('$_url/recipe/categories/?page_size=10',
        queryParameters: {'page_id': page, 'categories': categories});
    final result = response.data as List;
    return result.map<RecipeModel>((e) {
      return RecipeModel.fromMap(e);
    }).toList();
  }
}
