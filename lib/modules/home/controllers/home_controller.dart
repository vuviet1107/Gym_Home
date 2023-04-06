import 'dart:async';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 1), ((timer) {
      navigator();
      timer.cancel();
    }));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  navigator() {
    // if (AppState.authenticated) {
    //   Get.offAllNamed(
    //     Routes.DASHBOARD,
    //     arguments: {
    //       'showPopup': true,
    //     },
    //   );
    // } else {
      // Get.offAllNamed(Routes.LOGIN);
    // }
  }
}
