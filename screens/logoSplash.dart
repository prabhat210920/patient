import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoSplash extends StatelessWidget {
  const LogoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.logoSplashLinearGradient1,
      body: Container(
        width: double.infinity,
        height: Get.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.19, 0.07),
            end: Alignment(0.03, 0.88),
            colors: [
              AppColors.logoSplashLinearGradient1,
              AppColors.logoSplashLinearGradient2
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Next",
                  style: GoogleFonts.roboto(
                      color: const Color(0xffFCFCFC),
                      fontSize: 36,
                      height: 42.19 / 36,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Gen",
                  style: GoogleFonts.roboto(
                      color: const Color(0xffFCFCFC),
                      fontSize: 36,
                      height: 42.19 / 36,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Text('DOCTORS',
                style: GoogleFonts.roboto(
                    color: const Color(0xffFCFCFC),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 28.13 / 24,
                    letterSpacing: 0.865 * 24))
          ],
        ),
      ),
    ));
  }
}
