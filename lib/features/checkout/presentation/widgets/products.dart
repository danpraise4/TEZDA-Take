// ignore_for_file: must_be_immutable

import 'package:fetch/app.dart';
import 'package:fetch/features/checkout/presentation/providers/shop_providers.dart';
import 'package:fetch/features/checkout/presentation/screens/product_preview.dart';
import 'package:fetch/features/checkout/presentation/widgets/loading.dart';
import 'package:fetch/features/checkout/presentation/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends ConsumerStatefulWidget {
  Products({super.key, this.onNew});

  Function? onNew;

  @override
  ConsumerState<Products> createState() => _ProductsState();
}

class _ProductsState extends ConsumerState<Products> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(shopStateNotifierProvider.notifier).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(shopStateNotifierProvider);
    ref.listen(shopStateNotifierProvider, (previous, next) {});
    return Container(
      child: products.maybeWhen(
        loading: () => const LoadingProducts(),
        success: (products) {
          // get products data
         return GridView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 290),
            itemBuilder: (_, index) {
              return Product(
                product: products[index],
                onSelect: (x) {
                 Checkout.navKey.currentState?.pushNamed(ProductPreview.route , arguments: x);
                });
            },
          );
        },
        orElse: () {
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
