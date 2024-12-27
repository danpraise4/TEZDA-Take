import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewWrap extends StatefulWidget {
  const ReviewWrap({super.key, required this.model});

  final ProductModel model;

  @override
  State<ReviewWrap> createState() => _ReviewWrapState();
}

class _ReviewWrapState extends State<ReviewWrap> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.model.reviews?.length,
        itemBuilder: (_, i) {
          return singleReviewUI(i);
        });
  }

  Widget singleReviewUI(index) {
    Review? review = widget.model.reviews?[index];
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review?.reviewerName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text("${review?.rating} stars")
                ],
              )),
            ],
          ),
          8.height,
          Text(
            review?.comment ?? "",
            style: TextStyle(
              color: Palette.black,
            ),
          ),
          5.height,
          Row(
            children: [
              5.width,
              Text(
                "${review?.date.toString().split(' ')[0]}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Palette.primary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
