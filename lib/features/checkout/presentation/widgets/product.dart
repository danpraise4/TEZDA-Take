// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  Product({super.key, required this.onSelect, required this.product});

  Function(ProductModel) onSelect;
  ProductModel product;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelect.call(widget.product);
      },
      radius: 10,
      borderRadius: 10.br,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: 10.br,
              child: CachedNetworkImage(
                imageUrl: widget.product.images.first ?? '',
                height: 180,
                width: 250,
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
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                ratings()
              ],
            )
          ],
        ),
      ),
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
