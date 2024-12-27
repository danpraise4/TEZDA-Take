import 'package:another_flushbar/flushbar.dart';
import 'package:fetch/app.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

alert(String message, {bool isError = false}) {
  BuildContext context = Checkout.navKey.currentContext!;
  Flushbar(
    backgroundColor: isError ? Palette.red : Palette.primary,
    titleText:
        Text(message, style: TextStyle(fontSize: 14.sp, color: Palette.white)),
    messageText:
        Text(message, style: TextStyle(fontSize: 12.sp, color: Palette.white)),
    duration: const Duration(seconds: 3),
  ).show(context);
}
