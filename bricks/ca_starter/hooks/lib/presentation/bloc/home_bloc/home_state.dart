import '../../../common/state/view_data_state.dart';
import '../../../domain/entities/number_trivia_entity.dart';

class HomeState {
  final ViewData<NumberTriviaEntity> homeState;

  const HomeState({
    required this.homeState,
  });

  HomeState copyWith({
    ViewData<NumberTriviaEntity>? homeState,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
    );
  }
}
