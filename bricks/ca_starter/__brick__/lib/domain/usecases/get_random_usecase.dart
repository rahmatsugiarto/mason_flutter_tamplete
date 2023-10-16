import 'package:dartz/dartz.dart';

import '../../core/error/failure_response.dart';
import '../entities/number_trivia_entity.dart';
import '../repositories/repository.dart';

class GetRandomUseCase {
  final Repository repository;

  GetRandomUseCase(this.repository);

  Future<Either<FailureResponse, NumberTriviaEntity>> execute() {
    return repository.getRandomNumberTrivia();
  }
}
