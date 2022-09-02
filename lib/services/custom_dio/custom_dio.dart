import 'package:dio/native_imp.dart';
import 'package:food_recipe_app/services/interceptors/cache_interceptors.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    //interceptors.add(CacheInterceptors());
  }
}
