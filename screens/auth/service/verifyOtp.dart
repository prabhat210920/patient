import 'dart:convert';

import 'package:doctor/core/constant/appUrls.dart';
import 'package:doctor/data/cache/localData.dart';
import 'package:doctor/data/network/networkApiService.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final NetworkApiServices networkApiServices = NetworkApiServices();
  final LocalData localData = LocalData();
  Future<bool> verifyOtp({required String phone, required String otp}) async {
    Map<String, dynamic> data = {'mobile': phone, 'otp': otp};
    final json = jsonEncode(data);
    final res = await networkApiServices.postApiPublic(
        data: json, url: AppUrls.verifyOtp);
    if (res.statusCode == 200) {
      String accessToken = extractAcessToken(res.body);
      String refreshToken = extractRefreshToken(res.body);
      localData.setAccessToken(token: accessToken);
      localData.setRefreshToken(token: refreshToken);
      return true;
    }
    return false;
    print(res);
  }

  String extractAcessToken(dynamic res) {
    final json = jsonDecode(res);
    return json['tokens']['access'] ?? "";
  }

  String extractRefreshToken(
    dynamic res,
  ) {
    final json = jsonDecode(res);
    return json['tokens']['refresh'] ?? "";
  }
}
