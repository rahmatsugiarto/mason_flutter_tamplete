import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failure_response.dart';
import '../entities/number_trivia_entity.dart';
import '../repositories/repository.dart';

@LazySingleton()
class FetchRandomUseCase {
  final Repository repository;

  FetchRandomUseCase(this.repository);

  Future<Either<FailureResponse, NumberTriviaEntity>> execute() {
    return repository.getRandomNumberTrivia();
  }
}
