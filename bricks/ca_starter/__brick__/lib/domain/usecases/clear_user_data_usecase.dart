import 'package:injectable/injectable.dart';

import '../repositories/repository.dart';

@LazySingleton()
class ClearUserDataUseCase {
  final Repository repository;

  ClearUserDataUseCase(this.repository);

  Future<void> execute() async => await repository.clearUserData();
}
