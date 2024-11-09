import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/models/doctor.dart';
import 'package:doctor/screens/home/widgets/doctorCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBackGroundWhite,
          title: Text(
            "Our Doctors",
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: DoctorCard(
                    doctor: Doctor(
                        id: 1,
                        fullName: '',
                        basicInfo: BasicInfo(
                            id: 1,
                            profilePic: 'dfd',
                            degreeToDisplay: 'Mbbs',
                            experienceNumYear: 12,
                            professionalFee: '400',
                            specialty: Specialty(id: 1, name: 'Cardiologist'),
                            languages: [
                              Language(id: 1, name: 'Hindi'),
                            ]),
                        url: 'sdfsd',
                        slug: 'dksdjflsd'),
                  ));
            }),
      ),
    );
  }
}
