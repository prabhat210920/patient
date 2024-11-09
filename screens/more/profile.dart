import 'package:doctor/core/constant/imagePaths.dart';
import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/core/style/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.3),
      body: Column(
        children: [
          SizedBox(height: height * 0.1),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0x00000033),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(ImagePaths.profileImage)),
          ),
          const SizedBox(height: 12),
          Text(
            'Jack Human',
            style: AppTextStyle.largeBlack,
          ),
          Text('Jackhuman@gmail.com', style: AppTextStyle.smallBlack),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              "Edit Profile",
              style: AppTextStyle.xSmallWhite,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMenuItem(ImagePaths.wallet, 'Patient Wallet'),
                  _buildMenuItem(ImagePaths.helpCenter, 'Help Centre'),
                  _buildMenuItem(ImagePaths.share, 'Share App'),
                  _buildMenuItem(ImagePaths.logout, 'Logout'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String imagePath, String title) {
    return ListTile(
      leading: Image.asset(imagePath),
      title: Text(
        title,
        style: AppTextStyle.xSmallBlack,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
      onTap: () {
        // Handle menu item tap
      },
    );
  }
}
