import 'dart:io';

import 'package:doctor/data/network/appException.dart';
import 'package:doctor/data/network/baseApiService.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApiPublic({required String url}) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic response;
    try {
      final res =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      response = res;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return response;
  }

  @override
  Future<dynamic> postApiPublic(
      {required var data, required String url}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    final header = <String, String>{
      'Content-Type': 'application/json',
    };

    dynamic res;
    try {
      final response =
          await http.post(Uri.parse(url), headers: header, body: data);
      res = response;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(res);
    }
    return res;
  }

  @override
  Future<dynamic> getApiPrivate(
      {required String url, required String token}) async {
    dynamic response;
    try {
      final res = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token,
        },
      ).timeout(const Duration(seconds: 30));
      response = res;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return response;
  }

  @override
  Future<dynamic> postAPiPrivate(
      {required data, required String url, required String token}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': token.toString()
    };

    dynamic res;
    try {
      final response =
          await http.post(Uri.parse(url), headers: header, body: data);
      res = response;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(res);
    }
    return res;
  }
}
