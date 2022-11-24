import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state/view_data_state.dart';
import '{{name.snakeCase()}}_event.dart';
import '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}State({{name.camelCase()}}State: ViewData.initial(),)) {

//EXAMPLE
          // on<SignIn>(
    //   (event, emit) async {
    //     emit(
    //       SignInState(
    //         signInState: ViewData.loading(),
    //       ),
    //     );
    //     if (event.authRequestEntity.password.isNotEmpty &&
    //         event.authRequestEntity.username.isNotEmpty) {
    //       final result = await signInUseCase.call(event.authRequestEntity);
    //       result.fold(
    //         (failure) async => emit(
    //           SignInState(
    //             signInState: ViewData.error(
    //               message: failure.errorMessage,
    //               failure: failure,
    //             ),
    //           ),
    //         ),
    //         (result) async => await cacheTokenUseCase.call(result.token),
    //       );
    //       emit(
    //         SignInState(
    //           signInState: ViewData.loaded(),
    //         ),
    //       );
    //     } else {
    //       emit(
    //         SignInState(
    //           signInState: ViewData.error(
    //             message: AppConstants.errorMessage.formNotEmpty,
    //             failure: FailureResponse(
    //               errorMessage: AppConstants.errorMessage.formNotEmpty,
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
   
    on<{{name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}