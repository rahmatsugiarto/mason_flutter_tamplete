import '../../../core/state/view_data_state.dart';
import '../../../domain/entities/number_trivia_entity.dart';

class HomeState {
  final ViewData<NumberTriviaEntity> homeState;
  final String token;

  const HomeState({
    required this.homeState,
    required this.token,
  });

  HomeState copyWith({
    ViewData<NumberTriviaEntity>? homeState,
    String? token,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      token: token ?? this.token,
    );
  }
}
