class AppConstants {
  const AppConstants();

  static CachedKey cachedKey = const CachedKey();
  static AppApi appApi = const AppApi();
  static ErrorKey errorKey = const ErrorKey();
  static ErrorMessage errorMessage = const ErrorMessage();
}

class CachedKey {
  const CachedKey();

  String get onBoardingKey => 'onBoardingKey';

  String get tokenKey => 'tokenKey';

  String get fcmToken => 'fcmToken';
}

class AppApi {
  const AppApi();

  String get baseUrl => 'http://numbersapi.com';

  String get random => '/random';
}

class ErrorKey {
  const ErrorKey();
  String get message => "message";
}

class ErrorMessage {
  const ErrorMessage();

  String get noInternet => "Can't connect, please check your connection";

  String get errorCommon => "Opss.. Sorry, Something went wrong";
}
