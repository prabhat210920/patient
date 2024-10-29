import 'package:doctor/core/constant/imagePaths.dart';
import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.appBackGroundWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage(ImagePaths.profileImage), // Add profile image
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rasmie Malik",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppColors.blackText,
                        height: 16 / 15)),
                Text("How are you Today?",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: AppColors.blackText,
                        height: 15 / 13)),
              ],
            ),
          ],
        ),
        actions: [
          const Icon(Icons.notifications, color: Colors.black),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search by Specialty',
                  hintStyle: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                  // filled: true,
                  // fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Banner Section
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    AppColors.logoSplashLinearGradient1,
                    AppColors.logoSplashLinearGradient2
                  ]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Learn How to Stay Healthy\nFrom Covid 19",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                height: 20 / 16,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                height: 15 / 14,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: width * 0.3,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(
                              child: Text(
                                "Learn More",
                                style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 14 / 12,
                                    color: const Color(0xff2A9988)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Image.asset(ImagePaths.doctorHomePage),
                    )), // Add banner image
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Specialties Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Our Specialties",
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackText,
                          height: 15 / 14)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 15 / 12,
                        color: AppColors.blackText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _specialtyIcon(
                      ImagePaths.generalPhysician, "General Physician"),
                  _specialtyIcon(ImagePaths.diabetologist, "Diabetologist"),
                  _specialtyIcon(ImagePaths.cardioLogist, "Cardiologist"),
                  _specialtyIcon(ImagePaths.surgeon, "Surgeon"),
                ],
              ),
              const SizedBox(height: 16),
              // Doctors Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Meet Our Doctors",
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackText,
                          height: 15 / 14)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 15 / 12,
                          color: AppColors.blackText,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 8),
              _doctorCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _specialtyIcon(String imagePath, String label) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(16), // Adjust padding as needed
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              border: Border.all(
                color: const Color(0xffEBEBEB), // Border color
                width: 1, // Border width
              ),
              borderRadius:
                  BorderRadius.circular(14), // Optional: for rounded corners
            ),
            child: Image.asset(imagePath)),
        const SizedBox(height: 4),
        Text(label,
            style: GoogleFonts.lato(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 16 / 10,
                color: AppColors.blackText.withOpacity(0.8),
                letterSpacing: 0.15)),
      ],
    );
  }

  Widget _doctorCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
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
              Text(
                "18 years exp",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 16 / 14,
                    color: AppColors.primaryColor),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(12),
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
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Dr. Raman Kaur",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                  "Heart Surgeon",
                ),
                const Text("18 Years Exp  |  4.5/120 Reviews"),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Book Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
