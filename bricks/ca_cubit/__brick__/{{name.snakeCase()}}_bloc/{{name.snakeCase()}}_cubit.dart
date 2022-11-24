import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state/view_data_state.dart';
import '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  //YOUR USECASE
  // final GetRandomUseCase getRandomUseCase;

  {{name.pascalCase()}}Cubit({YOUR USECASE})
      : super({{name.pascalCase()}}State({{name.camelCase()}}State: ViewData.initial()));
  //EXAMPLE
  // void getNumberTriviaRandom() async {
  //   emit(
  //     HomeState(
  //       homeState: ViewData.loading(),
  //     ),
  //   );
  //   final result = await getRandomUseCase.execute();
  //   result.fold(
  //     (failure) => emit(
  //       HomeState(
  //         homeState:
  //             ViewData.error(message: failure.errorMessage, failure: failure),
  //       ),
  //     ),
  //     (result) => emit(
  //       HomeState(
  //         homeState: ViewData.loaded(data: result),
  //       ),
  //     ),
  //   );
  // }
}
