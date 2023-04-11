import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_styles.dart';
import 'package:remixicon/remixicon.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.title,
    this.elevation = 0,
    required this.body,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.backgroundColor,
    this.appBarColor,
    this.bottomNavigationBar,
  }) : super(key: key);
  final String title;
  final double? elevation;
  final Widget body;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? appBarColor;
  final Widget? bottomNavigationBar;

  void _handleBackButton() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: AppStyles.textW500(
            context,
            size: 18,
            color: AppColors.green5ED5A8,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 61,
        actions: actions,
        elevation: elevation,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: !automaticallyImplyLeading
            ? null
            : IconButton(
                icon: const Icon(
                  Remix.arrow_left_s_line,
                  size: 24,
                  color: AppColors.green5ED5A8,
                ),
                iconSize: 24,
                padding: const EdgeInsets.only(left: 16, right: 8),
                onPressed: _handleBackButton,
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              ),
        backgroundColor: appBarColor ?? AppColors.black1B232A,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar == null
          ? null
          : SafeArea(
              top: false,
              child: bottomNavigationBar!,
            ),
    );
  }
}
