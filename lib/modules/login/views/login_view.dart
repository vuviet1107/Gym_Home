import 'package:good_boy/common/auth_button.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_gap.dart';
import 'package:good_boy/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_dimens.dart';
import '../../../routes/app_pages.dart';
import '../../../util/assets_path/assets_gif/assets_gif.dart';
import '../../../util/key_const.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<LoginController>();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Center(
              child: Image.asset(
                fit: BoxFit.fill,
                PathGIF.gym_introduction,
                height: AppDimens.height,
                width: AppDimens.width,
              ),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Home Gym',
                  style: AppStyles.textW600(
                    context,
                    size: 36,
                    fontStyle: FontStyle.italic,
                    color: AppColors.whiteF1F4F6,
                  ),
                ),
                AppGap.h8,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Text(
                        'Leap',
                        style: AppStyles.textW600(
                          context,
                          size: 20,
                        ),
                      ),
                    ),
                    AppGap.w4,
                    Text(
                      'fitness',
                      style: AppStyles.textW600(
                        context,
                        size: 20,
                        color: AppColors.whiteColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            child: AuthButton(
              text: KeyConst.start.tr,
              horizontal: 71,
              button: () {
                Get.offAllNamed(Routes.HOME);
              },
            ),
          ),
        ],
      ),
    );
  }
}
