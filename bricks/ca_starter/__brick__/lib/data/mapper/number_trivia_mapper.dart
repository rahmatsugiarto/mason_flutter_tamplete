import '../../domain/entities/number_trivia_entity.dart';
import '../models/response/number_trivia_response.dart';

class NumberTriviaMapper {

  NumberTriviaEntity mapNumberTriviaToEntity(NumberTriviaResponse? res) {
    return NumberTriviaEntity(
      number: res?.number ?? 0,
      text: res?.text ?? "",
    );
  }
}
