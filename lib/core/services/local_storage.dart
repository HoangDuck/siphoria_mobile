import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SecureStorage {
  static const String ACCESS_TOKEN = "accessToken";
  static const String REFRESH_TOKEN = "refreshToken";
  static const String FCM_TOKEN = "fcmToken";
  static const String IS_FIRST_TIME = "is_first_time";
  static const String PASSWORD = "password";
  static const String USERNAME = "username";

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<String?> get accessToken async =>
      await _secureStorage.read(key: ACCESS_TOKEN);

  Future<String?> get refreshToken async =>
      await _secureStorage.read(key: REFRESH_TOKEN);

  Future<String?> get fcmToken async =>
      await _secureStorage.read(key: FCM_TOKEN);

  saveAccessToken(String token) async {
    await _secureStorage.write(key: ACCESS_TOKEN, value: token);
  }

  deleteAccessToken() async {
    await _secureStorage.delete(key: ACCESS_TOKEN);
  }

  saveRefreshToken(String token) async {
    await _secureStorage.write(key: REFRESH_TOKEN, value: token);
  }

  deleteRefreshToken() async {
    await _secureStorage.delete(key: REFRESH_TOKEN);
  }

  saveFCMToken(String token) async {
    await _secureStorage.write(key: FCM_TOKEN, value: token);
  }

  saveIsFirstTime() async {
    await _secureStorage.write(key: IS_FIRST_TIME, value: 'false');
  }

  Future<bool> isFirstTime() async {
    final isFirstTime = await _secureStorage.read(key: IS_FIRST_TIME);
    return isFirstTime == null || isFirstTime == 'true';
  }
}