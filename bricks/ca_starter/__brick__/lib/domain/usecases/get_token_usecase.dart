import 'package:injectable/injectable.dart';

import '../repositories/repository.dart';

@LazySingleton()
class GetTokenUseCase {
  final Repository repository;

  GetTokenUseCase(this.repository);

  Future<String> execute() async => await repository.getToken();
}
