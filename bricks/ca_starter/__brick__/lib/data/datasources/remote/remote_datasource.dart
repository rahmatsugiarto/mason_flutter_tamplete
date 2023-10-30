import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/app_constants.dart';
import '../../models/response/number_trivia_response.dart';

abstract class RemoteDataSource {
  Future<NumberTriviaResponse> getRandomNumberTrivia();
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  const RemoteDataSourceImpl({required this.dio});

  @override
  Future<NumberTriviaResponse> getRandomNumberTrivia() async {
    try {
      final response = await dio.get(
        "${AppConstants.appApi.baseUrl}${AppConstants.appApi.random}",
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return NumberTriviaResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
