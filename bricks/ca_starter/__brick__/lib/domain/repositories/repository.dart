import 'package:dartz/dartz.dart';

import '../../core/error/failure_response.dart';
import '../entities/number_trivia_entity.dart';

abstract class Repository {
  Future<Either<FailureResponse, NumberTriviaEntity>> getRandomNumberTrivia();
}
