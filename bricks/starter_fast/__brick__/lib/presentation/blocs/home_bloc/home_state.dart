import '../../../data/models/response/number_trivia_response.dart';

import '../../../core/state/view_data_state.dart';

class HomeState {
  final ViewData<NumberTriviaResponse> homeState;
  final String token;

  const HomeState({
    required this.homeState,
    required this.token,
  });

  HomeState copyWith({
    ViewData<NumberTriviaResponse>? homeState,
    String? token,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      token: token ?? this.token,
    );
  }
}
