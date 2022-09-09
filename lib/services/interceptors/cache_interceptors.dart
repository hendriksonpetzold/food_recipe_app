import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class CacheInterceptors implements InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.method == "GET") {
      if (response.requestOptions.path.contains('recipe?')) {
        final recipe = Hive.box('recipes');
        recipe.put(response.requestOptions.path, jsonEncode(response.data));
      } else {
        final categories = Hive.box('category');
        categories.put(response.requestOptions.path, jsonEncode(response.data));
      }
    }
    handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final categories = Hive.box('category');
    final recipes = Hive.box('recipes');
    if (recipes.containsKey(err.requestOptions.path)) {
      final json = recipes.get(err.requestOptions.path);

      if (json != null) {
        final data = jsonDecode(json);

        handler
            .resolve(Response(requestOptions: err.requestOptions, data: data));
      }
    } else {
      final json = categories.get(err.requestOptions.path);

      if (json != null) {
        final data = jsonDecode(json);

        handler
            .resolve(Response(requestOptions: err.requestOptions, data: data));
      }
    }
    handler.next(err);
  }
}
