import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static var smallBlack = GoogleFonts.lato(
      color: AppColors.blackText.withOpacity(0.8),
      fontSize: 13,
      fontWeight: FontWeight.w400);
  static var largeBlack = GoogleFonts.lato(
      color: AppColors.blackText, fontSize: 20, fontWeight: FontWeight.w700);

  static var xMediumBlack = GoogleFonts.lato(
      color: AppColors.blackText, fontSize: 18, fontWeight: FontWeight.w700);

  static var mediumBlack = GoogleFonts.lato(
      color: AppColors.blackText, fontSize: 16, fontWeight: FontWeight.w700);

  static var xSmallBlack = GoogleFonts.lato(
      color: AppColors.blackText, fontSize: 16, fontWeight: FontWeight.w500);

  static var xSmallWhite = GoogleFonts.lato(
      color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500);
}
