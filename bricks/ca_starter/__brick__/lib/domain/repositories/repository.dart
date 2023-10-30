import 'package:dartz/dartz.dart';

import '../../core/error/failure_response.dart';
import '../entities/number_trivia_entity.dart';

abstract class Repository {
  Future<void> saveToken(String? token);

  Future<String> getToken();

  Future<void> clearUserData();

  Future<Either<FailureResponse, NumberTriviaEntity>> getRandomNumberTrivia();
}
