import 'package:fetch/core/extensions/number.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final String? subTitle;
  final double? titleSize;
  final double? subTitleSize;
  final Widget? icon;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlignment;

  const HeaderText(
      {super.key,
      required this.title,
      this.subTitle,
      this.icon,
      this.subTitleSize,
      this.textAlignment,
      this.titleSize,
      this.mainAxisAlignment,
      this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          if (icon != null) icon!,
          
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w700,
                fontSize: titleSize ?? 18.sp),
          ),
          if (subTitle != null) ...[
            5.height,
            Text(
              subTitle!,
              textAlign: textAlignment,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500, fontSize: subTitleSize ?? 14.sp),
            )
          ]
        ],
      ),
    );
  }
}
