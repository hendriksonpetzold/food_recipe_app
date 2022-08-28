import 'package:dio/dio.dart';
import 'package:food_recipe_app/models/category_model.dart';

class CategoryRepository {
  Dio dio = Dio();

  Future<List<CategoryModel>> findAll() async {
    final response = await dio.get('http://18.229.155.21:8080/category');
    final result = response.data as List;

    return result.map<CategoryModel>((e) {
      return CategoryModel.fromMap(e);
    }).toList();
  }
}
