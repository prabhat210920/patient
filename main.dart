import 'package:doctor/initialBinding.dart';
import 'package:doctor/screens/TabBar.dart';
import 'package:doctor/screens/getStarted.dart';
import 'package:doctor/screens/mobileNumber.dart';
import 'package:doctor/screens/profile/profileInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Initialbinding initialBinding = Get.put(Initialbinding());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient',
      initialBinding: BindingsBuilder(() {
        Get.put(Initialbinding());
      }),
      home: Obx(() {
        if (initialBinding.isInitialized.value) {
          return initialBinding.accessToken.isNotEmpty
              ? initialBinding.profileCreated.value
                  ? const TabBarPage()
                  : const BasicInformationPage()
              : Mobilenumber();
        } else {
          return const GetStarted();
        }
      }),
      // home: BasicInformationPage(),
    );
  }
}
