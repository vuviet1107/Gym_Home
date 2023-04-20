import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:good_boy/constants/app_colors.dart';
import 'package:good_boy/util/utils/convert_value.dart';
import 'package:remixicon/remixicon.dart';

import '../../constants/app_dimens.dart';
import '../../constants/app_styles.dart';

class ShowDatePick extends StatefulWidget {
  const ShowDatePick({
    Key? key,
    this.title,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  final String? title;
  final DateTime? initialDateTime; // ngày hiển thị khi bấm vào
  final DateTime? minimumDate; // Chỉ cho phép chọn ngày từ năm xxxx trở đi
  final DateTime? maximumDate; // Chỉ cho phép chọn ngày đến ngày hiện tại

  @override
  State<ShowDatePick> createState() => _ShowDatePickState();
}

class _ShowDatePickState extends State<ShowDatePick> {
  late String _selectedDate;

  @override
  void initState() {
    super.initState();
    // Khởi tạo giá trị ban đầu cho biến _selectedDate
    _selectedDate =
        ConvertValue.convertUIDate(widget.initialDateTime ?? DateTime.now());
  }

  Future _onSelectionChanged(DateTime dateTime) async {
    setState(() {
      _selectedDate = ConvertValue.convertUIDate(
          dateTime); // cập nhật giá trị ngày được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.screenHeight300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: AppColors.black1B232A,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Remix.arrow_left_line,
                  size: 24,
                  color: AppColors.green5ED5A8,
                ),
                iconSize: 24,
                padding: const EdgeInsets.only(left: 16, right: 8),
                onPressed: () => Get.back(),
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              ),
              Flexible(
                child: Text(
                  widget.title ?? 'Chọn ngày',
                  style: AppStyles.textW500(
                    context,
                    size: 18,
                    color: AppColors.green5ED5A8,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  onPressed: () {
                    // lấy ngày được chọn và trả về kết quả
                    Get.back(result: _selectedDate);
                  },
                  icon: const Icon(
                    Remix.check_line,
                    size: 24,
                    color: AppColors.green5ED5A8,
                  )),
            ],
          ),
          Expanded(
            child: Container(
              color: AppColors.whiteColor,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: widget.initialDateTime ?? DateTime.now(),
                onDateTimeChanged: _onSelectionChanged,
                minimumDate: widget.minimumDate ?? DateTime(1800),
                maximumDate: widget.maximumDate ?? DateTime.now(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
