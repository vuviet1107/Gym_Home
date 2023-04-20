import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ConvertValue {
  static String convertUIDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String convertTimeString(String str) {
    return DateFormat('dd-MM-yyyy').format(DateFormat('dd/MM/yyyy').parse(str));
  }

  static String convertTime(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
