import 'dart:async';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer.periodic( const Duration(seconds: 5), ((timer) {
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
      Get.offAllNamed(
        Routes.HOME,
        arguments: {
          'showPopup': true,
        },
      );
    // } else {
    //   Get.offAllNamed(Routes.HOME);
    // }
  }
}
