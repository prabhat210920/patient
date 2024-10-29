import 'package:doctor/screens/auth/service/verifyOtp.dart';
import 'package:doctor/screens/profile/profileInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpBoxes extends StatefulWidget {
  final String phone;

  const OtpBoxes({super.key, required this.phone});

  @override
  State<OtpBoxes> createState() => _OtpBoxesState();
}

class _OtpBoxesState extends State<OtpBoxes> {
  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    // TODO: implement build
    return OtpTextField(
      fieldHeight: width * 0.12,
      fieldWidth: width * 0.12,
      fillColor: const Color(0xff2A9988),
      filled: true,
      autoFocus: true,
      clearText: true,
      enabled: true,
      textStyle: GoogleFonts.rubik(
          fontWeight: FontWeight.w500,
          color: const Color(0xffFAFFFE),
          fontSize: 30,
          height: 30 / 38),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      numberOfFields: 6,
      showFieldAsBox: true,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) async {
        await otpController.verifyOtp(
            phone: widget.phone, otp: verificationCode);
        Get.to(() => BasicInformationPage());
      },
    );
  }
}
