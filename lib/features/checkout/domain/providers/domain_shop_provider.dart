import 'package:dio/dio.dart';
import 'package:fetch/core/services/dio/dio_manager.dart';
import 'package:fetch/features/checkout/data/repository/shop_repository.dart';
import 'package:fetch/features/checkout/data/source/auth_remote_source.dart';
import 'package:fetch/features/checkout/domain/repositories/domain_shop_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDataSourceProvider = Provider.family<ShopUserDataSource, DioManager>(
  (_, networkService) => ShopUserRemoteDataSource(networkService),
);

final shopRepositoryProvider = Provider<ShopRepository>(
  (ref) {
    Dio dio = Dio();
    DioManager manager = DioManager(dio);

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: manager.onResponse,
      onRequest: manager.onRequest,
      onError: manager.onError,
    ));

    final ShopUserDataSource dataSource =
        ref.watch(shopDataSourceProvider(manager));

    return ShopRepositoryImpl(dataSource);
  },
);
