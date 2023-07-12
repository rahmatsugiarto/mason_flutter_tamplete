import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/state/view_data_state.dart';
import '../../../domain/usecases/get_random_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetRandomUseCase getRandomUseCase;

  HomeCubit({required this.getRandomUseCase})
      : super(HomeState(homeState: ViewData.initial()));

  void getNumberTriviaRandom() async {
    emit(
      HomeState(
        homeState: ViewData.loading(),
      ),
    );
    final result = await getRandomUseCase.execute();
    result.fold(
      (failure) => emit(
        HomeState(
          homeState:
              ViewData.error(message: failure.errorMessage, failure: failure),
        ),
      ),
      (result) => emit(
        HomeState(
          homeState: ViewData.loaded(data: result),
        ),
      ),
    );
  }
}
