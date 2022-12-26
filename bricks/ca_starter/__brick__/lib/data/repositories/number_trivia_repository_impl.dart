import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../common/constants/app_constants.dart';
import '../../common/error/failure_response.dart';
import '../../common/utils/extention.dart';
import '../../domain/entities/number_trivia_entity.dart';
import '../../domain/repositories/number_trivia_repository.dart';
import '../datasource/remote/remote_datasource.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final RemoteDataSource remoteDataSource;

  NumberTriviaRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<FailureResponse, NumberTriviaEntity>>
      getRandomNumberTrivia() async {
    try {
      final response = await remoteDataSource.getRandomNumberTrivia();
      return Right(response.toEntity());
    } on DioError catch (error) {
      if (error.isNoConnectionError) {
        return Left(
          ConnectionFailure(AppConstants.errorMessage.noInternet),
        );
      }
      log('Error at Repository Impl ${error.message.toString()}');
      return Left(
        ServerFailure(AppConstants.errorMessage.errorCommon),
      );
    } catch (e) {
      log('Error at Repository Impl ${e.toString()}');
      return Left(
        FailureResponse(errorMessage: AppConstants.errorMessage.errorCommon),
      );
    }
  }
}
