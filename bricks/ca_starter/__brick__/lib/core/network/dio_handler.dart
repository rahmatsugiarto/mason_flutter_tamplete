import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/log.dart';
import 'api_interceptors.dart';

class DioHandler {
  final String apiBaseUrl;
  late SharedPreferences sharedPreferences;

  DioHandler({
    required this.apiBaseUrl,
    required this.sharedPreferences,
  });

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 20000),
      sendTimeout: const Duration(milliseconds: 20000),
    );
    final dio = Dio(options);
    final retryInterceptor = RetryInterceptor(
      dio: dio,
      logPrint: Log.i, // specify log function (optional)
      retries: 7, // retry count (optional)
      retryDelays: List.generate(
        7,
        (index) => Duration(
          milliseconds: math.min(
            (3 ^ (index + 1)) + (index * 1000 + math.Random().nextInt(1000)),
            5000,
          ),
        ),
      ),
    );

    dio.interceptors.add(retryInterceptor);
    dio.interceptors.add(ApiInterceptors(sharedPreferences: sharedPreferences));

    return dio;
  }
}
