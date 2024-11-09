import 'package:doctor/core/constant/imagePaths.dart';
import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/core/style/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackGroundWhite,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xffFAFFFE),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: AppColors.blackText,
                                )),
                            const SizedBox(height: 12),
                            Text(
                              "Full Name",
                              style: AppTextStyle.largeBlack,
                            ),
                            Text(
                              'Heart sergon',
                              style: AppTextStyle.smallBlack,
                            ),
                            Text('MBBS, MD, FRCS (Family Medicine)',
                                style: AppTextStyle.smallBlack),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Image.asset(ImagePaths.briefCaseIcon),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '18 years exp',
                                  style: AppTextStyle.smallBlack,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Image.asset(ImagePaths.language),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'English, Hindi, Punjabi',
                                  style: AppTextStyle.smallBlack,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Color(0xff5e5e5e),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'CMC Medical Hospital ',
                                  style: AppTextStyle.smallBlack,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              ImagePaths.doctorCardImage,
                              height: 100,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.message,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Message',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: AppColors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 20, thickness: 1),
                Text('Consultation', style: AppTextStyle.mediumBlack),
                const Text(
                  'Self',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
                SizedBox(
                  height: 8,
                ),
                _buildComplaintSection(),
                const SizedBox(height: 16),
                Text('Booking on', style: AppTextStyle.mediumBlack),
                Text(
                  '14 Aug, 2023, 12:30 PM',
                  style: AppTextStyle.xMediumBlack,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Prescription',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('15 Aug, 2023, 02:30 PM',
                                  style: AppTextStyle.xSmallBlack),
                              Text('Lorem Ipsum is simply dummy text of the...',
                                  style: AppTextStyle.smallBlack),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.download),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Upload Reports'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Download All Prescription'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComplaintSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Patient’s Complaint",
            style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.blackText),
          ),
          SizedBox(height: 6),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
            style: AppTextStyle.smallBlack,
          ),
        ],
      ),
    );
  }
}
