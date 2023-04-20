import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_dimens.dart';
import 'package:good_boy/constants/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.hintText,
    this.contentPadding,
    this.suffixText,
    this.showSuffixIcon = false,
    this.prefixIcon,
    this.prefixText,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.fillColor,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.suffixIcon,
  }) : super(key: key);

  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final String? suffixText;
  final bool showSuffixIcon;
  final IconData? prefixIcon;
  final String? prefixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final Widget? suffixIcon;
  bool obscureText = false;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.textW400(
        context,
        size: AppDimens.textSize16,
        color: AppColors.whiteColor,
      ),
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      validator: widget.validator,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.disabled,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? AppColors.black161C22,
        filled: true,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: widget.hintText,
        hintStyle: AppStyles.textW400(
          context,
          size: AppDimens.textSize14,
          color: AppColors.grey666666,
        ),
        suffixIcon: !widget.showSuffixIcon
            ? widget.suffixIcon
            : IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.grey777777,
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              ),
        // suffixIcon == null ? null : Icon(suffixIcon),
        suffixText: widget.suffixText,

        suffixStyle: AppStyles.textW400(
          context,
          size: AppDimens.textSize14,
          color: AppColors.grey666666,
        ),
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        prefixText: widget.prefixText,
        prefixStyle: AppStyles.textW400(
          context,
          size: AppDimens.textSize14,
          color: AppColors.grey666666,
        ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.green5ED5A8,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
        errorBorder: widget.errorBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redDD4B4B),
            ),
        errorStyle: AppStyles.textW400(
          context,
          size: AppDimens.textSize14,
          color: AppColors.redDD4B4B,
        ),
      ),
    );
  }
}
