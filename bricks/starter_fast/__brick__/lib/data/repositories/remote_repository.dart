import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/utils/extension.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_constants.dart';
import '../models/response/number_trivia_response.dart';

abstract class RemoteRepository {
  Future<Either<String, NumberTriviaResponse>> getRandomNumberTrivia();
}

@LazySingleton()
class RemoteRepositoryImpl implements RemoteRepository {
  final Dio dio;

  const RemoteRepositoryImpl({required this.dio});

  @override
  Future<Either<String, NumberTriviaResponse>> getRandomNumberTrivia() async {
    try {
      final response = await dio.get(AppConstants.appApi.random);

      return Right(NumberTriviaResponse.fromJson(response.data));
    } on DioException catch (error) {
      if (error.isNoConnectionError) {
        return Left(AppConstants.errorMessage.noInternet);
      }
      return Left(AppConstants.errorMessage.errorCommon);
    } catch (e) {
      return Left(AppConstants.errorMessage.errorCommon);
    }
  }
}
