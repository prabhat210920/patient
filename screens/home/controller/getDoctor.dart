import 'dart:convert';

import 'package:doctor/core/constant/appUrls.dart';
import 'package:doctor/models/doctor.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetDoctor extends GetxController {
  Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(Uri.parse(AppUrls.getDoctor));

    if (response.statusCode == 200) {
      // Parse the JSON
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}
