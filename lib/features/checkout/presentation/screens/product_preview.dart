// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/storage/storage.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/appbar.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';

import 'package:fetch/features/checkout/presentation/widgets/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductPreview extends StatefulWidget {
  const ProductPreview({super.key, required this.product});

  final ProductModel product;

  static const String route = '/product/preview';

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  final TextEditingController couterController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: KAppBar(
        background: Palette.white,
        onPop: () => Navigator.pop(context),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: 10.br,
                    child: CachedNetworkImage(
                      imageUrl: widget.product.images.first ?? '',
                      height: 210,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.height,
                  Text(
                    widget.product.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5.sp,
                    ),
                  ),
                  6.height,
                  Text(
                    widget.product.brand ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        "₦${widget.product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Spacer(),
                      ratings()
                    ],
                  ),
                  10.height,
                  Row(
                    children: [
                      Text(
                        "Rwviews",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Spacer(),
                      ValueListenableBuilder(
                        valueListenable: mainStg.listenable(),
                        builder: (context, value, child) {
                          bool value = mainStg.get(widget.product.id,
                              defaultValue: false);

                          return GestureDetector(
                            onTap: () {
                              mainStg.put(widget.product.id, !value);
                            },
                            child: Container(
                              color: Palette.white,
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                value ? Icons.favorite : Icons.favorite_border,
                                color: Palette.primary,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  10.height,
                  ReviewWrap(
                    model: widget.product,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget ratings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.star,
          color: Colors.amber.shade800,
        ),
        Text(
          "4.5 (1)",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
