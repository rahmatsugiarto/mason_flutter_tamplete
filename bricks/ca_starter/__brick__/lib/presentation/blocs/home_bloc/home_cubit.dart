import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/state/view_data_state.dart';
import '../../../domain/usecases/clear_user_data_usecase.dart';
import '../../../domain/usecases/fetch_random_usecase.dart';
import '../../../domain/usecases/get_token_usecase.dart';
import '../../../domain/usecases/save_token_usecase.dart';
import 'home_state.dart';

@LazySingleton()
class HomeCubit extends Cubit<HomeState> {
  final FetchRandomUseCase fetchRandomUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final GetTokenUseCase getTokenUseCase;
  final ClearUserDataUseCase clearUserDataUseCase;

  HomeCubit({
    required this.fetchRandomUseCase,
    required this.saveTokenUseCase,
    required this.getTokenUseCase,
    required this.clearUserDataUseCase,
  }) : super(HomeState(
          homeState: ViewData.initial(),
          token: "",
        ));

  void getNumberTriviaRandom() async {
    emit(
      state.copyWith(
        homeState: ViewData.loading(),
      ),
    );

    final result = await fetchRandomUseCase.execute();
    result.fold(
      (failure) => emit(
        state.copyWith(
          homeState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) async {
        emit(
          state.copyWith(
            homeState: ViewData.loaded(data: result),
          ),
        );
        await saveTokenUseCase.execute(token: result.text);
      },
    );
  }

  void getToken() async {
    final result = await getTokenUseCase.execute();
    emit(state.copyWith(token: result));
  }

  void clearToken() async {
    await clearUserDataUseCase.execute();
    getToken();
  }
}
