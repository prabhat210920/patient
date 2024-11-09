import 'package:doctor/screens/appoinment/controller/currentSelection.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  var currentTab = options.upcoming.obs;

  void changeTab(options option) {
    currentTab.value = option;
  }
}
