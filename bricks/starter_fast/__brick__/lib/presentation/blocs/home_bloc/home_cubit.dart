import '../../../data/repositories/local_repository.dart';
import '../../../data/repositories/remote_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/state/view_data_state.dart';
import 'home_state.dart';

@LazySingleton()
class HomeCubit extends Cubit<HomeState> {
  final RemoteRepositoryImpl remote;
  final LocalRepositoryImpl local;

  HomeCubit({
    required this.remote,
    required this.local,
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

    final result = await remote.getRandomNumberTrivia();
    result.fold(
      (message) => emit(
        state.copyWith(
          homeState: ViewData.error(message: message),
        ),
      ),
      (result) async {
        emit(
          state.copyWith(
            homeState: ViewData.loaded(data: result),
          ),
        );
        await local.saveToken(result.text);
      },
    );
  }

  void getToken() async {
    final result = await local.getToken();
    emit(state.copyWith(token: result));
  }

  void clearToken() async {
    await local.clearUserData();
    getToken();
  }
}
