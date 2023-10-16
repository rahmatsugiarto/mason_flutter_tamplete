import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/constants/app_constants.dart';
import '../../core/error/failure_response.dart';
import '../../core/utils/extension.dart';
import '../../domain/entities/number_trivia_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote/remote_datasource.dart';
import '../mapper/number_trivia_mapper.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<FailureResponse, NumberTriviaEntity>>
      getRandomNumberTrivia() async {
    try {
      final response = await remoteDataSource.getRandomNumberTrivia();
      final mapper = NumberTriviaMapper();
      return Right(mapper.mapNumberTriviaToEntity(response));
    } on DioException catch (error) {
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
