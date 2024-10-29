import 'dart:convert';

import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/screens/auth/otpPage.dart';
import 'package:doctor/screens/auth/service/authetication.dart';
import 'package:doctor/screens/auth/widget/phoneTextField.dart';
import 'package:doctor/screens/auth/widget/submitButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Mobilenumber extends StatelessWidget {
  Mobilenumber({super.key});
  final TextEditingController phoneController = TextEditingController();

  Future<void> auth() async {
    final AuthController authController = Get.put(AuthController());
    final res = await authController.signup(phoneController.text);
    if (res.statusCode == 200) {
      Get.to(Otppage(phoneNumber: phoneController.text));
    } else {
      final jsonData = jsonDecode(res.body);
      final error = jsonData['error'];
      if (error == 'This mobile number is already registered') {
        final res = await authController.login(phoneController.text);
        if (res.statusCode == 200) {
          Get.to(() => Otppage(phoneNumber: phoneController.text));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.mobileNumberBackground,
      body: Container(
        width: double.infinity,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Text(
                      "Enter Your Mobile",
                      style: GoogleFonts.lato(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          height: 34 / 32,
                          color: AppColors.blackText),
                    ),
                    Text(
                      "Number",
                      style: GoogleFonts.lato(
                          fontSize: 34,
                          height: 34 / 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackText),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "We will send you a confirmation code",
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 15 / 14,
                          color: Color(0xff011411)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              PhoneNumberInput(
                phoneController: phoneController,
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Submitbutton(
                onPressed: () async {
                  await auth();
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
