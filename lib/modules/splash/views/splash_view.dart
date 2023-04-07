import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_dimens.dart';
import 'package:good_boy/modules/splash/views/widgets/animated_padding_widget.dart';
import 'package:good_boy/util/assets_path/assets_png/assets_png.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      backgroundColor: AppColors.black1B232A,
      body: Center(
        child: AnimatedPaddingWidget(
          duration: const Duration(seconds: 5),
          animateTween: Tween<double>(begin: 0, end: 1),
          child: Image.asset(
            PathPNG.img_splash,
          ),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.greenColor.withOpacity(0.0),
                AppColors.greenColor.withOpacity(0.15)
              ],
              stops: const [0.283, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: AppDimens.height179),
    );
  }
}
