import 'package:fetch/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Back({onPop, leadingIcon , color}) {
  BuildContext context = Checkout.navKey.currentContext!;
  return Row(
    children: [
      IconButton(
        splashRadius: 28,
        onPressed: onPop,
        icon: Icon(
          leadingIcon ?? Icons.arrow_back_ios_new_outlined,
          size: 16,
          color: Colors.black
        ),
      ),
      Text(
        "Back",
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.onSurface,
          fontSize: 12.sp,
        ),
      )
    ],
  );
}
