import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_constants.dart';
import '../../core/error/failure_response.dart';
import '../../core/utils/extension.dart';
import '../../domain/entities/number_trivia_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/local/local_datasource.dart';
import '../datasources/remote/remote_datasource.dart';
import '../mapper/number_trivia_mapper.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<void> saveToken(String? token) async {
    localDataSource.saveToken(token);
  }

  @override
  Future<String> getToken() async {
    return localDataSource.getToken();
  }

  @override
  Future<void> clearUserData() async {
    return localDataSource.clearUserData();
  }

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
      return Left(
        ServerFailure(AppConstants.errorMessage.errorCommon),
      );
    } catch (e) {
      return Left(
        FailureResponse(errorMessage: AppConstants.errorMessage.errorCommon),
      );
    }
  }
}
