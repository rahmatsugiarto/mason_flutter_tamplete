import 'package:dio/dio.dart';

import 'api_interceptors.dart';

class DioHandler {
  final String apiBaseUrl;
  // late SharedPreferences sharedPreferences;

  DioHandler({
    required this.apiBaseUrl,
    // required this.sharedPreferences,
  });

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    final dio = Dio(options);
    // dio.interceptors.add(ApiInterceptors(sharedPreferences: sharedPreferences));
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }
}
