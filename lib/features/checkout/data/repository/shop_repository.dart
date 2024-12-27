import 'package:either_dart/either.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';
import 'package:fetch/features/checkout/data/source/auth_remote_source.dart';
import 'package:fetch/features/checkout/domain/repositories/domain_shop_repository.dart';

class ShopRepositoryImpl extends ShopRepository {
  final ShopUserDataSource dataSource;

  ShopRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, List<ProductModel>>> getProducts() {
    return dataSource.getProducts();
  }
}
