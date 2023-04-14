import 'package:good_boy/common/auth_button.dart';
import 'package:good_boy/common/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_boy/common/label_text_widget.dart';
import 'package:good_boy/common/will_unfocus_form_scope.dart';
import 'package:good_boy/constants/app_dimens.dart';
import '../../../common/custom_text_form_field.dart';
import '../../../constants/app_gap.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillUnfocusFormScope(
      child: CustomScaffold(
        title: 'title',
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelTextWidget(
                  labelText: 'Họ tên',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  hintText: 'Nhập họ tên...',
                ),
                AppGap.h20,
                LabelTextWidget(
                  labelText: 'Email',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  hintText: 'Nhập địa chỉ email...',
                ),
                AppGap.h20,
                LabelTextWidget(
                  labelText: 'Số điện thoại',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  hintText: 'Nhập số điện thoại...',
                ),
                AppGap.h20,
                LabelTextWidget(
                  labelText: 'Mật khẩu',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  showSuffixIcon: true,
                  hintText: 'Nhập mật khẩu...',
                ),
                AppGap.h20,
                LabelTextWidget(
                  labelText: 'Nhập lại mật khẩu',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  showSuffixIcon: true,
                  hintText: 'Nhập mật khẩu...',
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppGap.h20,
            AuthButton(
              // width: AppDimens.width157,
              height: AppDimens.height10,
              text: 'Đăng ký',
              button: () {},
            ),
            AppGap.h20,
          ],
        ),
      ),
    );
  }
}
