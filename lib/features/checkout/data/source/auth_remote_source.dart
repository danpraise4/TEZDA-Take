import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:fetch/core/apis/api_auth.dart';
import 'package:fetch/core/apis/api_endpoints.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/core/services/dio/dio_manager.dart';
import 'package:fetch/features/checkout/data/models/product.model.dart';

abstract class ShopUserDataSource {
  Future<Either<AppException, List<ProductModel>>> getProducts();
}

class ShopUserRemoteDataSource implements ShopUserDataSource {
  final DioManager manager;

  ShopUserRemoteDataSource(this.manager);

  @override
  Future<Either<AppException, List<ProductModel>>> getProducts() async {
    try {
      // something

      final result = await manager.dio
          .get(productsUrl, options: Options(headers: headers));
      log(result.statusMessage.toString());
      if (result.statusCode == 200) {
        log(result.data["products"].toString());

        return Right(List<ProductModel>.from((result.data["products"] as List)
            .map((e) => ProductModel.fromMap(e))));
      }

      throw (Exception(result.data['message']));
    } catch (e) {
      log(e.toString());

      return Left(
        AppException(
          message: e.toString(),
          statusCode: 1,
          identifier: 'Auth.login',
        ),
      );
    }
  }
}
