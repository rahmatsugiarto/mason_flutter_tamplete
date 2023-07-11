class FailureResponse {
  final String errorMessage;

  const FailureResponse({required this.errorMessage});
}

class ServerFailure extends FailureResponse {
  ServerFailure(String errorMessage) : super(errorMessage: errorMessage);
}

class ConnectionFailure extends FailureResponse {
  ConnectionFailure(String errorMessage) : super(errorMessage: errorMessage);
}

class DatabaseFailure extends FailureResponse {
  DatabaseFailure(String errorMessage) : super(errorMessage: errorMessage);
}
