import 'package:doctor/core/utils/getAccessToken.dart';
import 'package:doctor/data/cache/localData.dart';
import 'package:doctor/screens/auth/service/getUser.dart';
import 'package:get/get.dart';

class Initialbinding extends GetxController {
  var isInitialized = false.obs;
  var accessToken = ''.obs;
  var userId = ''.obs;
  var profileCreated = false.obs;
  final LocalData localData = LocalData();

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  Future<void> initialize() async {
    try {
      final token = await getAccessToken();
      if (token != null) {
        accessToken.value = token;
        final GetUser getUser = Get.put(GetUser());
        final users = await getUser.getUser();
        if (users.isNotEmpty) {
          localData.setUserId(userId: users[0].id.toString());
          userId.value = users[0].id.toString();
          if (users[0].defaultProfile.defaultProfile == null) {
            profileCreated.value = false;
          } else {
            profileCreated.value = true;
          }
        }

        isInitialized.value = true;
      } else {
        isInitialized.value = false;
      }
    } catch (e) {
      isInitialized.value = false;
    } finally {
      isInitialized.value = true;
    }
  }
}
