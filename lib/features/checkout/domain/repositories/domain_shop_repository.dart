import 'package:either_dart/either.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';

abstract class ShopRepository {
  Future<Either<AppException, List<ProductModel>>> getProducts();
}
