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
      body: SafeArea(
        child: Center(
          child: AnimatedPaddingWidget(
              child: Image.asset(
                PathPNG.logo_app,
                width: 175,
                height: 175,
              ),
              duration: Duration(seconds: 1),
              animateTween: Tween<double>(begin: 0, end: 1)),
        ),
      ),
    );
  }
}
