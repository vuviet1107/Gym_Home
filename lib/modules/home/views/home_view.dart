import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:good_boy/common/button/auth_button.dart';
import 'package:good_boy/common/scaffold/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_boy/common/text/label_text_widget.dart';
import 'package:good_boy/common/scaffold/will_unfocus_form_scope.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_dimens.dart';
import 'package:remixicon/remixicon.dart';
import '../../../common/date_time/show_date_picker.dart';
import '../../../common/text_field/custom_text_form_field.dart';
import '../../../constants/app_gap.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillUnfocusFormScope(
      child: CustomScaffold(
        title: 'Đăng ký tài khoản Nhà tuyển dụng',
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelTextWidget(
                  labelText: 'Email',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  controller: controller.emailController,
                  hintText: 'Nhập địa chỉ email...',
                ),
                AppGap.h20,
                const LabelTextWidget(
                  labelText: 'Mật khẩu',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  controller: controller.passwordController,
                  showSuffixIcon: true,
                  hintText: 'Nhập mật khẩu...',
                ),
                AppGap.h20,
                const LabelTextWidget(
                  labelText: 'Nhập lại mật khẩu',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  controller: controller.enterThePasswordController,
                  showSuffixIcon: true,
                  hintText: 'Nhập mật khẩu...',
                ),
                AppGap.h20,
                const LabelTextWidget(
                  labelText: 'Tên công ty',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  controller: controller.nameCompanyController,
                  hintText: 'Nhập tên công ty',
                ),
                AppGap.h20,
                const LabelTextWidget(
                  labelText: 'Số điện thoại',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  controller: controller.phoneCompanyController,
                  hintText: 'Nhập số điện thoại...',
                ),
                AppGap.h20,
                const LabelTextWidget(
                  labelText: 'Ngày thành lập',
                  showRequired: true,
                ),
                AppGap.h12,
                CustomTextFormField(
                  controller: controller.foundingDateController,
                  readOnly: true,
                  hintText: 'dd/mm/yy',
                  suffixIcon: const Icon(
                    Remix.calendar_line,
                    color: AppColors.grey777777,
                  ),
                  onTap: () async {
                    final result = await showModalBottomSheet(
                        backgroundColor: AppColors.transparentColor,
                        context: context,
                        builder: (BuildContext context) {
                          return const ShowDatePick(
                            title: 'Ngày thành lập',
                          );
                        });
                    controller.foundingDateController.text = result;
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppGap.h20,
            AuthButton(
              width: AppDimens.screenWidth157,
              height: AppDimens.screenHeight40,
              text: 'Đăng ký',
              button: () {},
            ),
            AppGap.h20,
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    TextEditingController dateController = TextEditingController();

    DateTime? currentDate = DateTime.now();
    if (dateController.text.isNotEmpty) {
      currentDate = DateTime.parse(dateController.text);
    }

    final result = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: currentDate!,
            onDateTimeChanged: (DateTime newDate) {
              // Xử lý khi người dùng thay đổi ngày
            },
          ),
        );
      },
    );

    if (result != null) {
      dateController.text = result.toString().substring(0, 10);
    }
  }
}
