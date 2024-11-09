import 'package:doctor/core/constant/imagePaths.dart';
import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/data/network/meta.dart';
import 'package:doctor/models/doctor.dart';
import 'package:doctor/screens/home/screens/doctorBySpeciality.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Speciality extends StatefulWidget {
  const Speciality({super.key});
  @override
  State<Speciality> createState() => _SpecialityState();
}

class _SpecialityState extends State<Speciality> {
  final GetMeta meta = Get.put(GetMeta(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackGroundWhite,
        title: Text(
          "Our Speciality",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            color: AppColors.blackText,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.appBackGroundWhite,
      body: Obx(() => meta.specialists.isNotEmpty
          ? Container(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: meta.specialists.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  final Specialty specialty = meta.specialists[index];
                  return GestureDetector(
                      onTap: () {
                        Get.to(DoctorBySpeciality());
                      },
                      child: _specialtyIcon(ImagePaths.surgeon, specialty));
                },
              ),
            )
          : SizedBox.shrink()),
    );
  }

  Widget _specialtyIcon(String imagePath, Specialty speciality) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        border: Border.all(
          color: const Color(0xffEBEBEB), // Border color
          width: 1, // Border width
        ),
        borderRadius:
            BorderRadius.circular(12), // Optional: for rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            offset: const Offset(2, 4),
            blurRadius: 14,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 12),
          Center(
            child: Text(speciality.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 16 / 10,
                    color: AppColors.blackText.withOpacity(0.8),
                    letterSpacing: 0.15)),
          ),
        ],
      ),
    );
  }
}
