import 'package:dartz/dartz.dart';

import '../../common/error/failure_response.dart';
import '../entities/number_trivia_entity.dart';

abstract class NumberTriviaRepository {
  Future<Either<FailureResponse, NumberTriviaEntity>> getRandomNumberTrivia();
}
