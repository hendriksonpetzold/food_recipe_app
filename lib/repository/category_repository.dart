import 'package:dio/dio.dart';
import 'package:food_recipe_app/models/category_model.dart';

class CategoryRepository {
  Dio dio = Dio();
  final String _url = const String.fromEnvironment('url');
  Future<List<CategoryModel>> findAll() async {
    final response = await dio.get('$_url/category');
    final result = response.data as List;

    return result.map<CategoryModel>((e) {
      return CategoryModel.fromMap(e);
    }).toList();
  }
}
