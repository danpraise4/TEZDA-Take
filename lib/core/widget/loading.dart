import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget kLoading() {
  return SizedBox(
    width: 20.h,
    height: 20.h,
    child:  const Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );
}
