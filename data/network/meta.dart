import 'dart:convert';

import 'package:doctor/core/constant/appUrls.dart';
import 'package:doctor/models/doctor.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetMeta extends GetxController {
  // Defining observable lists
  var languages = <Language>[].obs;
  var specialists = <Specialty>[].obs;

  Future<void> init() async {
    await storeLanguageList();
    await storeSpecialityList();
  }

  Future<dynamic> getMeta(String url) async {
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      return res;
    }
    return null;
  }

  Future<void> storeLanguageList() async {
    final res = await getMeta(AppUrls.getLanguage);
    if (res != null) {
      final jsonResponse = jsonDecode(res.body);
      languages.value = jsonResponse
          .map<Language>((item) => Language.fromJson(item))
          .toList();
    }
  }

  Future<void> storeSpecialityList() async {
    final res = await getMeta(AppUrls.getSpecialists);
    if (res != null) {
      final jsonResponse = jsonDecode(res.body);
      specialists.value = jsonResponse
          .map<Specialty>((item) => Specialty.fromJson(item))
          .toList();
    }
  }
}
