import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/widget/styled_text.dart';
import 'package:fetch/features/introduction/data/model/onboard.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({super.key, required this.item});

  final OnboardModel item;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            item.image,
            width: 200.w,
            height: 100.h,
            colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
              BlendMode.srcIn,
            ),
          ),
          20.height,
          StyledText(
            text: item.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          5.height,
          Text(item.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
