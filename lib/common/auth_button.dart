import 'package:flutter/material.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    required this.button,
    this.borderRadius,
    this.buttonColor,
    this.horizontal,
    this.width,
    this.height,
  }) : super(key: key);

  final String text;
  final Color? buttonColor;
  final double? horizontal;
  final VoidCallback button;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: button,
      child: Container(
        width: width,
        height: height,
        padding:
            EdgeInsets.symmetric(horizontal: horizontal ?? 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          color: buttonColor ?? AppColors.green5ED5A8,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyles.textW400(
            context,
            size: 18,
          ),
        ),
      ),
    );
  }
}
