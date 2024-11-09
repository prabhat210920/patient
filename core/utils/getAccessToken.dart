import 'package:doctor/data/cache/localData.dart';
import 'package:doctor/screens/mobileNumber.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<String?> getAccessToken() async {
  final LocalData localData = LocalData();
  final String? token = await localData.getAccessToken();
  bool isTokenValid = isValid(token!);
  if (!isTokenValid) {
    Get.offAll(Mobilenumber());
    return null;
  }
  return token;
}

bool isValid(String token) {
  final decodedToken = JwtDecoder.decode(token);
  final exp = decodedToken['exp'];
  final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
  final currentDate = DateTime.now();

  // Check if the token is expired
  return currentDate.isBefore(expiryDate);
}

Future<String?> getRefreshToken() async {
  final LocalData localData = LocalData();
  final String? token = await localData.getRefreshToken();
  return token;
}
