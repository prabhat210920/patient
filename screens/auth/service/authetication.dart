import 'package:doctor/core/constant/appUrls.dart';
import 'package:doctor/data/network/networkApiService.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;
  final NetworkApiServices networkApiServices = NetworkApiServices();

  Future<dynamic> signup(String mobileNumber) async {
    isLoading.value = true;
    final data = '{\n  "mobile": "$mobileNumber"\n}\n';
    final headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppUrls.signup);
    final res = await http.post(url, headers: headers, body: data);
    isLoading.value = false;
    return res;
  }

  Future<dynamic> login(String mobileNumber) async {
    isLoading.value = true;
    final data = '{\n  "mobile": "$mobileNumber"\n}\n';

    final headers = {
      'Content-Type': 'application/json',
    };

    final url = Uri.parse(AppUrls.login);

    final res = await http.post(url, headers: headers, body: data);
    final status = res.statusCode;
    isLoading.value = false;
    return res;
  }
}
