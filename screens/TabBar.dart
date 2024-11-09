import 'package:doctor/core/style/appColors.dart';
import 'package:doctor/screens/appoinment/appoinment.dart';
import 'package:doctor/screens/home/screens/HomeScreen.dart';
import 'package:doctor/screens/more/profile.dart';
import 'package:doctor/screens/service/bottomeNavigationController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPage();
}

class _TabBarPage extends State<TabBarPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  final List<Widget> _pages = [
    const HomeScreen(),
    const Appoinment(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: _pages[bottomNavController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.bottomNavBarColor,
          currentIndex: bottomNavController.selectedIndex.value,
          unselectedItemColor: AppColors.inActiveTabBarColor,
          fixedColor: AppColors.activeTabBarColor,
          iconSize: 40,
          selectedLabelStyle: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 15 / 12,
              color: AppColors.activeTabBarColor),
          unselectedLabelStyle: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 15 / 12,
              color: AppColors.inActiveTabBarColor.withOpacity(0.4)),
          onTap: (index) {
            bottomNavController.changeTabIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: bottomNavController.selectedIndex.value == 0
                  ? const FaIcon(FontAwesomeIcons.house,
                      color: AppColors.activeTabBarColor)
                  : FaIcon(FontAwesomeIcons.house,
                      color: AppColors.inActiveTabBarColor.withOpacity(0.4)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: bottomNavController.selectedIndex.value == 1
                  ? const FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: AppColors.activeTabBarColor,
                    )
                  : FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: AppColors.inActiveTabBarColor.withOpacity(0.4),
                    ),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: bottomNavController.selectedIndex.value == 2
                  ? const FaIcon(
                      Icons.grid_view_rounded,
                      color: AppColors.activeTabBarColor,
                    )
                  : Icon(Icons.grid_view_rounded,
                      color: AppColors.inActiveTabBarColor.withOpacity(0.4)),
              label: 'More',
            ),
          ],
        ),
      );
    });
  }
}
