import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneNumberInput({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return TextFormField(
      controller: phoneController,
      autofocus: true,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: width * 0.1, right: 4.0),
          child: Text(
            '+91',
            style: GoogleFonts.lato(
              fontSize: 34,
              fontWeight: FontWeight.w500,
              height: 38 / 34,
              color: AppColors.blackText,
            ),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: '0000 0000 00',
        hintStyle: GoogleFonts.lato(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          height: 38 / 34,
          color: Colors.grey,
        ),
        border: InputBorder.none, // Removes outline border
      ),
      style: GoogleFonts.lato(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        height: 38 / 34,
        color: Colors.grey,
      ),
    );
  }
}
