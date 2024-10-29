import 'dart:convert';

import 'package:doctor/core/constant/appUrls.dart';
import 'package:doctor/core/utils/getAccessToken.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  Future<void> createProfile(
      {required String name,
      required String dob,
      required String adderess}) async {
    final token = await getAccessToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final data = {
      "is_primary": true,
      "full_name": name,
      "date_of_birth": dob,
      "address": adderess,
      "gender": 'M'
    };

    final url = Uri.parse(AppUrls.profile);

    final res = await http.post(
      url,
      headers: headers,
      body: json.encode(data),
    );

    final status = res.statusCode;
  }
}
