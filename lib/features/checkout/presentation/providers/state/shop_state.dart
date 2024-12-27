import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_state.freezed.dart';

@freezed
abstract class ShopState with _$ShopState {
  const factory ShopState.initial() = Initial;
  const factory ShopState.loading() = Loading;
  const factory ShopState.failure(AppException exception) = Failure;
  const factory ShopState.success(List<ProductModel> products) = Success;
  
}
