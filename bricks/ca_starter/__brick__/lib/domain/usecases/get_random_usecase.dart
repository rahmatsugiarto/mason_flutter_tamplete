import 'package:dartz/dartz.dart';

import '../../common/error/failure_response.dart';
import '../entities/number_trivia_entity.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomUseCase {
  final NumberTriviaRepository repository;

  GetRandomUseCase(this.repository);

  Future<Either<FailureResponse, NumberTriviaEntity>> execute() {
    return repository.getRandomNumberTrivia();
  }
}
