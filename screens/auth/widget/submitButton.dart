import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Submitbutton extends StatelessWidget {
  final VoidCallback onPressed;
  const Submitbutton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(
            "Submit",
            style: GoogleFonts.rubik(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 15 / 20,
                color: const Color(0xffFAFFFE)),
          ),
        ),
      ),
    );
  }
}
