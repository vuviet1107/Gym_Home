import 'package:good_boy/modules/splash/views/widgets/animated_padding_widget.dart';
import 'package:good_boy/util/assets_path/assets_png/assets_png.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.red,
            child: Text('12312321'),
          ),
        ),
      ),
    );
  }
}
