import 'package:doctor/core/router/routesName.dart';
import 'package:doctor/screens/getStarted.dart';
import 'package:doctor/screens/mobileNumber.dart';
import 'package:get/get.dart';

class MyRouter {
  static List<GetPage> routes = [
    GetPage(
      name: RoutesName.splashPage,
      page: () => const GetStarted(),
    ),
    GetPage(
      name: RoutesName.auth,
      page: () => Mobilenumber(),
    ),
  ];
}
