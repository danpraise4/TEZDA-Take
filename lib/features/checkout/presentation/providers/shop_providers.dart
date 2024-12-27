import 'package:fetch/features/checkout/domain/providers/domain_shop_provider.dart';
import 'package:fetch/features/checkout/domain/repositories/domain_shop_repository.dart';
import 'package:fetch/features/checkout/presentation/providers/state/shop_notifier.dart';
import 'package:fetch/features/checkout/presentation/providers/state/shop_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopStateNotifierProvider =
    StateNotifierProvider<ShopNotifier, ShopState>(
  (ref) {
    final ShopRepository shopRepository = ref.watch(shopRepositoryProvider);

    return ShopNotifier(
      shopRepository: shopRepository,
    );
  },
);
