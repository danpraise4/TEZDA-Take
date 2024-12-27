import 'package:fetch/app.dart';
import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/widget/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppBar extends AppBar {
  final String? titleText;
  final List<Widget>? actionButtons;
  final PreferredSizeWidget? bottomView;
  final Widget? leadingView;
  final VoidCallback? onPop;
  final double? height;
  final double? leadingViewWidth;
  final TextStyle? titleStyle;
  final double? titleSpace;
  final bool isCenter;
  final bool forceTransparency;
  final Color? background;
  final Widget? titleView;
  final IconData? leadingIcon;
  final KAlignment alignment;
  final AppBarType type;

  KAppBar({
    super.key,
    this.titleText,
    this.actionButtons,
    this.bottomView,
    this.leadingView,
    this.height,
    this.type = AppBarType.type1,
    this.titleSpace,
    this.titleStyle,
    this.onPop,
    this.leadingViewWidth,
    this.forceTransparency = false,
    this.alignment = KAlignment.center,
    this.isCenter = false,
    this.background,
    this.titleView,
    this.leadingIcon,
  }) : super(
          backgroundColor: Colors.transparent,
          title: type == AppBarType.type1
              ? titleText != null
                  ? (alignment == KAlignment.center)
                      ? Builder(builder: (context) {
                          BuildContext context = Checkout.navKey.currentContext!;
                          return Text(
                            titleText,
                            style: titleStyle ??
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 20.sp,
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.w600),
                          );
                        })
                      : titleView
                  : null
              : null,
          actions: [
            if (alignment == KAlignment.end)
              if (titleText != null) ...[
                Builder(
                  builder: (context) {
                    BuildContext context = Checkout.navKey.currentContext!;
                    return Center(
                      child: Text(
                        titleText,
                        style: titleStyle ??
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),                  ),
                    );
                  }
                ),
                15.width,
              ] else if (titleView != null) ...[
                Center(child: titleView),
                15.width,
              ],

            if (type == AppBarType.type2) ...[
              if (onPop != null)
                Builder(builder: (context) {
                  BuildContext context = Checkout.navKey.currentContext!;

                  return Row(
                    children: [
                      IconButton(
                        splashRadius: 28,
                        onPressed: onPop,
                        icon: Icon(
                          leadingIcon ?? Icons.close,
                          size: 16,
                        ),
                      ),
                      Text(
                        "Close",
                        style: Theme.of(context).textTheme.bodySmall,
                        // TextStyle(color: Palette.textGray, fontSize: 12.sp),
                      ),
                      10.width,
                    ],
                  );
                })
            ],

            //  Text(titleText!),
            ...actionButtons ?? []
          ],
          centerTitle: isCenter,
          elevation: 0.0,
          titleSpacing: titleSpace,
          toolbarHeight: height,
          surfaceTintColor: Colors.transparent,
          bottom: bottomView,
          leadingWidth: leadingViewWidth ?? 100,
          forceMaterialTransparency: forceTransparency,
          leading: type == AppBarType.type1
              ? leadingView ??
                  (onPop != null
                      ? Back(
                          onPop: onPop,
                          leadingIcon: leadingIcon,
                        )
                      : const SizedBox.shrink())
              : Padding(
                  padding: [10, 15].insets,
                  child: Text(
                    titleText!,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
        );
}
