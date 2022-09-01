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
      final instance = Hive.box('category');
      instance.put(response.requestOptions.path, jsonEncode(response.data));
    }
    handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final instance = Hive.box('category');
    if (instance.containsKey(err.requestOptions.path)) {
      final json = instance.get(err.requestOptions.path);
      if (json != null) {
        final data = jsonDecode(json);
        handler
            .resolve(Response(requestOptions: err.requestOptions, data: data));
      }
    }
  }
}
