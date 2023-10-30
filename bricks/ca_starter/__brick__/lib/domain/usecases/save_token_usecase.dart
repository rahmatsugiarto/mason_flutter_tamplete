import 'package:injectable/injectable.dart';

import '../repositories/repository.dart';

@LazySingleton()
class SaveTokenUseCase {
  final Repository repository;

  SaveTokenUseCase(this.repository);

  Future<void> execute({String? token}) {
    return repository.saveToken(token);
  }
}
