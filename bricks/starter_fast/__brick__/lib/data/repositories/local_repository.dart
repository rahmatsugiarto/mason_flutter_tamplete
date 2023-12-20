import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_constants.dart';

abstract class LocalRepository {
  Future<void> saveToken(String? token);
  Future<String> getToken();
  Future<void> clearUserData();
}

@LazySingleton()
class LocalRepositoryImpl implements LocalRepository {
  final SharedPreferences sharedPreferences;

  LocalRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> saveToken(String? token) async {
    sharedPreferences.setString(AppConstants.cachedKey.tokenKey, token ?? '');
  }

  @override
  Future<String> getToken() async {
    return sharedPreferences.getString(AppConstants.cachedKey.tokenKey) ?? '';
  }

  @override
  Future<void> clearUserData() async {
    sharedPreferences.setString(AppConstants.cachedKey.tokenKey, '');
  }
}
