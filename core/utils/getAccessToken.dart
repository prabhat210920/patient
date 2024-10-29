import 'package:doctor/data/cache/localData.dart';

Future<String?> getAccessToken() async {
  final LocalData localData = LocalData();
  final String? token = await localData.getAccessToken();
  return token;
}

Future<String?> getRefreshToken() async {
  final LocalData localData = LocalData();
  final String? token = await localData.getRefreshToken();
  return token;
}
