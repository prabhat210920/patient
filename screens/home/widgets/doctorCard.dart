import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/models/doctor.dart';
import 'package:doctor/screens/home/screens/doctorDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x24000000),
            offset: Offset(2, 4),
            blurRadius: 14,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  doctor.basicInfo.profilePic,
                  height: 90,
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      doctor.fullName,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.blackText,
                          height: 20 / 16),
                    ),
                    Text(
                      doctor.basicInfo.specialty.name,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.blackText.withOpacity(0.8),
                          height: 20 / 16),
                    ),
                    Text(
                      doctor.basicInfo.experienceNumYear.toString(),
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.blackText.withOpacity(0.8),
                          height: 20 / 16),
                    ),
                    Text(
                      doctor.basicInfo.languages.toString(),
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff686868),
                          height: 24 / 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '${doctor.basicInfo.experienceNumYear.toString()} years exp',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 16 / 14,
                    color: AppColors.primaryColor),
              ),
              const Spacer(),
              Icon(
                Icons.star,
                color: Color(0xffFFD450),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '4.5/120 Reviews',
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackText.withOpacity(0.7),
                    height: 12 / 17),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.to(DoctorDetailsPage());
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Set your desired radius here
                  ),
                ),
                child: Text(
                  "View Details",
                  style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 16 / 12,
                      color: AppColors.redAcent),
                ),
              ),
              const Spacer(),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xff92CCC3).withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    // Male Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          child: const Text(
                            "400",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Female Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Book Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
