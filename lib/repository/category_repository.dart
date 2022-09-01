import 'package:dio/dio.dart';
import 'package:food_recipe_app/models/category_model.dart';
import 'package:food_recipe_app/services/custom_dio/custom_dio.dart';

class CategoryRepository {
  CustomDio dio = CustomDio();
  final String _url = const String.fromEnvironment('url');
  Future<List<CategoryModel>> findAll() async {
    final response = await dio.get('$_url/category');
    final result = response.data as List;

    return result.map<CategoryModel>((e) {
      return CategoryModel.fromMap(e);
    }).toList();
  }
}
