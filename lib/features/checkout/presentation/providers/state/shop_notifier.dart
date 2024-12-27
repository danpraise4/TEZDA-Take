import 'package:fetch/features/checkout/domain/repositories/domain_shop_repository.dart';
import 'package:fetch/features/checkout/presentation/providers/state/shop_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopNotifier extends StateNotifier<ShopState> {
  final ShopRepository shopRepository;

  ShopNotifier({
    required this.shopRepository,
  }) : super(const ShopState.initial());

  Future<void> getProducts() async {
    state = const ShopState.loading();
    final response = await shopRepository.getProducts();

    state = await response.fold(
      (failure) => ShopState.failure(failure),
      (products) async {
        return ShopState.success(products);
      },
    );
  }

}
