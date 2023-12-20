class AppConstants {
  const AppConstants();

  static CachedKey cachedKey = const CachedKey();
  static AppApi appApi = const AppApi();
  static ErrorKey errorKey = const ErrorKey();
  static ErrorMessage errorMessage = const ErrorMessage();
  static TagDialog tagDialog = const TagDialog();
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

class TagDialog {
  const TagDialog();

  String get tagDialogLoading => "tag_dialog_loading";

  String get tagDialog => "tag_dialog";

}
