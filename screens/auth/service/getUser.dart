import 'dart:convert';

import 'package:doctor/core/constant/appUrls.dart';
import 'package:doctor/core/utils/getAccessToken.dart';
import 'package:doctor/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetUser extends GetxController {
  Future<List<UserModel>> getUser() async {
    final accessToken = await getAccessToken();
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    final url = Uri.parse(AppUrls.getUser);

    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(res.body);
      return jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
