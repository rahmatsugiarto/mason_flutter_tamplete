import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_handler.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences async {
    return await SharedPreferences.getInstance();
  }

  @preResolve
  Future<Dio> get dio async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return DioHandler(
      apiBaseUrl: "",
      sharedPreferences: sharedPreferences,
    ).dio;
  }
}
