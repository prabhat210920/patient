import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static const _accessToken = 'accessToken';
  static const _refreshToken = 'refreshToken';
  static const _userId = 'userId';

  Future<void> setAccessToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessToken, token);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessToken);
  }

  Future<void> setUserId({required String userId}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, userId);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId);
  }

  Future<void> setRefreshToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshToken, token);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshToken);
  }
}
