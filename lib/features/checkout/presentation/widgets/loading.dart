import 'package:circular_rotation/circular_rotation.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/image.dart';
import 'package:fetch/core/widget/styled_text.dart';
import 'package:fetch/features/checkout/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulsator/pulsator.dart';

class LoadingProducts extends StatefulWidget {
  const LoadingProducts({super.key});

  @override
  State<LoadingProducts> createState() => _LoadingProductsState();
}

class _LoadingProductsState extends State<LoadingProducts> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: mappingImage(),
    );
  }

  Widget mappingImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 400,
          padding: const EdgeInsets.all(10),
          child: CircularRotation(
            circularRotationProperty: CircularRotationModel(
              firstCircleFill: true,
              secondCircleFill: false,
              thirdCircleFill: true,
              firstCircleFillColor: Palette.getOoprimary(context).withOpacity(0.1),
              secondCircleFillColor:Palette.getOoprimary(context).withOpacity(0.05),
              thirdCircleFillColor: Palette.white,
              firstCircleStrokeColor: Palette.transparent,
              secondCircleStrokeColor: Palette.transparent,
              thirdCircleStrokeColor: Palette.transparent,
              defaultCircleStrokeColor: Colors.white,
              startAnimation: true,
              repeatAnimation: true,
              firstCircleAnimationDuration: 15000,
              secondCircleAnimationDuration: 7000,
              thirdCircleAnimationDuration: 10000,
              centerWidget: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: Pulsator(
                  style: PulseStyle(
                      color: Palette.getOoprimary(context), borderWidth: 10),
                  count: 1,
                  duration: const Duration(seconds: 5),
                  // repeat: 1,
                  startFromScratch: false,
                  autoStart: true,
        
                  fit: PulseFit.contain,
                  child: Container(
                      padding:  const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Palette.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: personImage(CENTER_IMAGE_1, 100)),
                ),
              ),
              firstCircleWidgets: [
                personImage(CENTER_IMAGE_4, 55),
                personImage(CENTER_IMAGE_5, 55),
                personImage(CENTER_IMAGE_6, 55),
                personImage(CENTER_IMAGE_7, 55),
              ],
              secondCircleWidgets: [],
              thirdCircleWidgets: [
                personImage(CENTER_IMAGE_2, 40),
                personImage(CENTER_IMAGE_3, 40)
              ],
            ),
          ),
        ),
        StyledText(
            text: "Loading <c>Products....",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                )),
      ],
    );
  }

  Widget personImage(String imageUrl, double size) {
    return KImage(
      url: imageUrl,
      width: size,
      height: size,
      radius: 100,
    );
  }
}