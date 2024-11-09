import 'package:get/get.dart';

enum options { upcoming, completed, pending }

class CurrentSelection extends GetxController {
  var isUpcoming = true.obs;
  var isCompleted = false.obs;
  var isPending = false.obs;

  void changeVisibility(options opt) {
    if (opt == options.upcoming) {
      isUpcoming.value = true;
      isCompleted.value = false;
      isPending.value = false;
    } else if (opt == options.pending) {
      isUpcoming.value = false;
      isCompleted.value = false;
      isPending.value = true;
    } else {
      isUpcoming.value = false;
      isCompleted.value = true;
      isPending.value = false;
    }
  }
}
