import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController emailController,
      passwordController,
      enterThePasswordController,
      nameCompanyController,
      phoneCompanyController,
      foundingDateController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    enterThePasswordController = TextEditingController();
    nameCompanyController = TextEditingController();
    phoneCompanyController = TextEditingController();
    foundingDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
