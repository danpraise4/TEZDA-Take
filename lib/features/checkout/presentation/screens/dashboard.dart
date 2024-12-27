import 'package:carousel_slider/carousel_slider.dart';
import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/core/storage/dispatch.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/image.dart';
import 'package:fetch/features/checkout/presentation/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const route = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                _profileHeader(),
                Expanded(
                  child: Products(),
                ),
              ],
            ),
          ),
          cartItems(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0.0,
    );
  }

  Widget _btn({required IconData icon, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1.r,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, size: 20.r),
      ),
    );
  }

  Widget _profileHeader() {
    return Row(
      children: [
        KImage(url: getUser!.image, width: 45, height: 45, radius: 45),
        10.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${getUser?.firstName}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                "What service do you need today?",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
        _btn(icon: HugeIcons.strokeRoundedSearch01, onPressed: () {}),
        10.width,
        _btn(icon: HugeIcons.strokeRoundedIncognito, onPressed: () {}),
      ],
    );
  }

  Widget cartItems() {
    bool isCan = true;

    return AnimatedContainer(
      margin: [10, 20].insets,
      padding: 13.insets,
      height: 65.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: Palette.primary, borderRadius: 10.br),
      duration: 400.milliseconds,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "7 Item(s) in your cart",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Palette.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                2.height,
                Flexible(
                  child: Text(
                    "Scan product bar code to add",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Palette.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            width: 1,
            height: isCan ? 100 : 0,
            curve: Curves.easeInOut,
            decoration:
                BoxDecoration(color: Palette.white, borderRadius: 10.br),
            duration: 850.milliseconds,
          ),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  if (isCan)
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, SelfCheckout.route);
                      },
                      child: AnimatedOpacity(
                          opacity: isCan ? 1.0 : 0,
                          duration: 850.milliseconds,
                          child: AnimatedPadding(
                            padding: EdgeInsets.only(left: isCan ? 20 : 0),
                            duration: 850.milliseconds,
                            curve: Curves.easeInOut,
                            child: Row(
                              children: [
                                // Turn this into a corusel that alternate between the amount and the "View Basket"

                                SizedBox(
                                  width: 100,
                                  child: CarouselSlider(
                                      options: CarouselOptions(
                                          height: 400.0,
                                          autoPlay: true,
                                          scrollDirection: Axis.vertical),
                                      items: [
                                        Text(
                                          "₦ 192,530.00",
                                          style: TextStyle(
                                            color: Palette.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "View your cart",
                                          style: TextStyle(
                                            color: Palette.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ]),
                                ),
                                5.width,
                                // if (basket.isNotEmpty)
                                Badge.count(
                                  count: 2,
                                  isLabelVisible: true,
                                  backgroundColor: Palette.black,
                                  child: SvgPicture.asset(
                                    '$svgPath/icon_bag.svg',
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                )
                              ],
                            ),
                          )),
                    )
                ],
              )),
          Icon(Icons.arrow_forward_ios_outlined, size: 14, color: Palette.white)
        ],
      ),
    );
    ;
  }
}
