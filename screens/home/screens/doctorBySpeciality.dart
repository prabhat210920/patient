import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/models/doctor.dart';
import 'package:doctor/screens/home/widgets/doctorCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorBySpeciality extends StatefulWidget {
  const DoctorBySpeciality({super.key});

  @override
  _DoctorBySpecialityState createState() => _DoctorBySpecialityState();
}

class _DoctorBySpecialityState extends State<DoctorBySpeciality>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackGroundWhite,
        title: Text(
          "Our Doctors",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            color: AppColors.blackText,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'Cardiology'),
            Tab(text: 'Dermatology'),
            Tab(text: 'Diabetes'),
            Tab(text: 'Heart Surgery'),
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.appBackGroundWhite,
      body: TabBarView(
        controller: _tabController,
        children: List.generate(4, (index) => buildDoctorList()),
      ),
    );
  }

  Widget buildDoctorList() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        DoctorCard(
            doctor: Doctor(
                id: 1,
                fullName: 'dffsdf',
                basicInfo: BasicInfo(
                    id: 1,
                    profilePic:
                        'https://img.freepik.com/premium-vector/avatar-bearded-doctor-doctor-with-stethoscope-vector-illustrationxa_276184-31.jpg',
                    degreeToDisplay: 'Mbbs',
                    experienceNumYear: 12,
                    professionalFee: '200',
                    specialty: Specialty(id: 1, name: 'cardiologins'),
                    languages: [
                      Language(id: 1, name: 'english')
                    ]),
                url:
                    'https://img.freepik.com/premium-vector/avatar-bearded-doctor-doctor-with-stethoscope-vector-illustrationxa_276184-31.jpg',
                slug: 'dfsdf')),
      ],
    );
  }
}
