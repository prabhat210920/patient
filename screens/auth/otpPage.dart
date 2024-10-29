import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/screens/TabBar.dart';
import 'package:doctor/screens/auth/service/getUser.dart';
import 'package:doctor/screens/auth/service/verifyOtp.dart';
import 'package:doctor/screens/auth/widget/resendOtp.dart';
import 'package:doctor/screens/auth/widget/submitButton.dart';
import 'package:doctor/screens/profile/profileInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Otppage extends StatefulWidget {
  final String phoneNumber;
  Otppage({super.key, required this.phoneNumber});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  final _otpController = TextEditingController();
  final OtpController otpController = Get.put(OtpController());

  final width = Get.width;
  static const _maxDigits = 6;
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
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
                      "Enter Code send",
                      style: GoogleFonts.lato(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          // height: 34 / 32,
                          color: AppColors.blackText),
                    ),
                    Text(
                      "to Your Number",
                      style: GoogleFonts.lato(
                          fontSize: 32,
                          // height: 34 / 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackText),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Enter the 4 Digit number sent to +91 ${widget.phoneNumber}}",
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 15 / 14,
                          color: AppColors.blackText),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Center(
                child: Pinput(
                  controller: _otpController,
                  // focusNode: _focusNode,
                  useNativeKeyboard: true,
                  // ignore: avoid_redundant_argument_values
                  length: _maxDigits,
                  // useNativeKeyboard: false,
                  readOnly: false,
                  focusedPinTheme: PinTheme(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: width * 0.1,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: width * 0.1,
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  followingPinTheme: PinTheme(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: width * 0.1,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: width * 0.1,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.errorColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ResendOtpView(
                  onOtpSend: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Submitbutton(onPressed: () async {
                await verifyOTP();
              }),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> verifyOTP() async {
    final isVerified = await otpController.verifyOtp(
        phone: widget.phoneNumber, otp: _otpController.text);
    if (isVerified) {
      final GetUser getUser = Get.put(GetUser());
      final users = await getUser.getUser();
      if (users[0].defaultProfile.defaultProfile == null) {
        Get.to(() => const BasicInformationPage());
      } else {
        Get.to(() => const TabBarPage());
      }
    }
  }
}
