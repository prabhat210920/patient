import 'package:doctor/core/constant/imagePaths.dart';
import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/screens/appoinment/controller/currentSelection.dart';
import 'package:doctor/screens/appoinment/controller/tabController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Appoinment extends StatefulWidget {
  const Appoinment({super.key});

  @override
  State<Appoinment> createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
  final TabBarController tabController = Get.put(TabBarController());
  // final SlotController slotController = Get.put(SlotController());
  final DateFormat formatter = DateFormat('d MMM, y, hh:mm a');
  bool isDataAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackGroundWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Appointments",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.blackText,
            height: 15 / 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => buildTabButton(
                      label: "Upcoming",
                      isSelected:
                          tabController.currentTab.value == options.upcoming,
                      onTap: () => tabController.changeTab(options.upcoming))),
                  Obx(() => buildTabButton(
                      label: "Pending",
                      isSelected:
                          tabController.currentTab.value == options.pending,
                      onTap: () => tabController.changeTab(options.pending))),
                  Obx(() => buildTabButton(
                      label: "Completed",
                      isSelected:
                          tabController.currentTab.value == options.completed,
                      onTap: () => tabController.changeTab(options.completed))),
                ],
              ),
              Obx(() {
                // Conditional rendering based on the selected tab
                if (tabController.currentTab.value == options.upcoming) {
                  return buildUpcomingAppointments(false);
                } else if (tabController.currentTab.value == options.pending) {
                  return buildPendingAppointments();
                } else if (tabController.currentTab.value ==
                    options.completed) {
                  return buildCompletedAppointments();
                } else {
                  return Container();
                }
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget doctorAppoinmentCard(bool isShowDownloadPrescription) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(14),
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
        borderRadius:
            BorderRadius.circular(8), // Optional: Add rounded corners if needed
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
                  'https://imgs.search.brave.com/WCZBFB8okO_lNyqz30UmCPj3S-1XnA-KGiov-ou0_8g/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTE5/OTIxMDE2L3Bob3Rv/L2RvY3Rvci5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9Y253/VTNidlcyVkozbjNs/RFRsYmdRUzNpY2cw/OGhlX3ptX0RfZGVr/NWZCRT0',
                  height: 90,
                  width: 75,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Prabhat Kumar',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 20 / 16,
                          color: AppColors.blackText)),
                  Text(
                    'General Physician',
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 16 / 13,
                        color: AppColors.blackText.withOpacity(0.8)),
                  ),
                  Text(
                    'MBBS, MD, FRCS (Family Medicine)',
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 16 / 13,
                        color: AppColors.blackText.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Place button at the end (right)
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isShowDownloadPrescription)
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                // Get.to(() => PatientDetailsPage());
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                side:
                                    const BorderSide(color: AppColors.redAcent),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12), // Set your desired radius here
                                ),
                              ),
                              child: Text(
                                "Download prescription",
                                style: GoogleFonts.rubik(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    height: 16 / 12,
                                    color: AppColors.redAcent),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      OutlinedButton(
                        onPressed: () {
                          // Get.to(() => PatientDetailsPage());
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          side: const BorderSide(color: AppColors.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Set your desired radius here
                          ),
                        ),
                        child: Text(
                          "Upload report",
                          style: GoogleFonts.rubik(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              height: 16 / 12,
                              color: AppColors.primaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            height: 1,
            color: AppColors.blackText.withOpacity(0.3),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                'Booked on:',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 15 / 12,
                    color: AppColors.blackText),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '3:15 pm',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    height: 16 / 13,
                    color: AppColors.blackText),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget noData() {
    final height = Get.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.2,
        ),
        Image.asset(ImagePaths.noDataImage),
        SizedBox(
          height: height * 0.05,
        ),
        Text(
          "No consultancy found for",
          style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.25,
              letterSpacing: 0.15,
              color: AppColors.blackText),
        ),
        Text(
          "this category",
          style: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 1.25,
              letterSpacing: 0.15,
              color: AppColors.blackText),
        ),
      ],
    );
  }

  Widget buildTabButton(
      {required String label,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Color(0xffE9E9E9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: GoogleFonts.lato(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            color: isSelected ? AppColors.white : AppColors.blackText,
          ),
        ),
      ),
    );
  }

  Widget buildUpcomingAppointments(bool isDataAvailabe) {
    // Replace with your specific widget for "Upcoming" appointments
    return SingleChildScrollView(
      child: isDataAvailabe
          ? Column(
              children: [
                doctorAppoinmentCard(false),
                doctorAppoinmentCard(false),
                doctorAppoinmentCard(false),
                doctorAppoinmentCard(false),
              ],
            )
          : Center(child: noData()),
    );
    // return Column(
    //   children: List.generate(5, (index) => patientDetail(false)),
    // );
  }

  Widget buildPendingAppointments() {
    // Replace with your specific widget for "Pending" appointments
    return Column(
      children: List.generate(3, (index) => patientDetail(true)),
    );
  }

  Widget buildCompletedAppointments() {
    // Replace with your specific widget for "Completed" appointments
    return Column(
      children: List.generate(2, (index) => patientDetail(true)),
    );
  }

  Widget patientDetail(bool isPending) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
        borderRadius:
            BorderRadius.circular(8), // Optional: Add rounded corners if needed
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  ImagePaths.doctorCardImage,
                  height: 100,
                  width: 85,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Dr. Raman Kaur",
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 16 / 15,
                          color: AppColors.blackText)),
                  Text(
                    "Female",
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 16 / 13,
                        color: AppColors.blackText),
                  ),
                  Text(
                    "18 Years",
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 16 / 13,
                        color: AppColors.blackText),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // Get.to(() => PatientDetailsPage());
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          side: const BorderSide(color: AppColors.primaryColor),
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
                              color: AppColors.primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      if (isPending)
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            side: const BorderSide(color: Color(0xffF56B62)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Set your desired radius here
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.message_outlined,
                                color: Color(0xffF56B62),
                                size: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Message",
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 16 / 12,
                                    color: Color(0xffF56B62)),
                              ),
                            ],
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: AppColors.blackText.withOpacity(0.3),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                'Booked on:',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 15 / 12,
                    color: AppColors.blackText),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '15 Aug, 2023,  04:30 PM',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    height: 16 / 13,
                    color: AppColors.blackText),
              ),
            ],
          )
        ],
      ),
    );
  }
}
