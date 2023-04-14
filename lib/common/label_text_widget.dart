import 'package:flutter/cupertino.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/constants/app_dimens.dart';
import 'package:good_boy/constants/app_styles.dart';

class LabelTextWidget extends StatelessWidget {
  const LabelTextWidget({
    Key? key,
    required this.labelText,
    this.showRequired = false,
  }) : super(key: key);

  final String labelText;
  final bool showRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: labelText,
        style: AppStyles.textW400(
          context,
          size: AppDimens.textSize16,
          color: AppColors.black1C1D20,
        ),
        children: !showRequired
            ? null
            : <TextSpan>[
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.redDD4B4B,
                  ),
                ),
              ],
      ),
    );
  }
}
