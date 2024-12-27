import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

Widget accountDoesNotExist(BuildContext context , {
  required Function onClick
}) {
  return SizedBox(
    height: 350,
    child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            5.height,
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
              ),
            ),
            15.height,
            Container(
              width: 100,
              height: 100,
              padding: 20.insets,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(50)),
              child: SvgPicture.asset('$svgPath/icon_champ.svg'),
            ),
            15.height,
            Text("Please continue to setup your account",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 17.sp)),
            10.height,
            const Text(
              "Looks like your account is not registered with us at Checkout, Please continue to setup your account",
              textAlign: TextAlign.center,
            ),
            15.height,
            KButton(
                color: Palette.black,
                child: Text("Continue",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Palette.white, fontWeight: FontWeight.w600)))
          ],
        ),
      ),
    ),
  );
}

Widget accountDoesnotExist() {
  return Scaffold(
    body: Column(
      children: [Text("data")],
    ),
  );
}
