import 'package:dio/dio.dart';
import 'package:fetch/core/services/dio/dio_manager.dart';
import 'package:fetch/features/authentication/data/repository/auth_repository.dart';
import 'package:fetch/features/authentication/data/source/auth_remote_source.dart';
import 'package:fetch/features/authentication/domain/repositories/domain_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider = Provider.family<AuthUserDataSource, DioManager>(
  (_, networkService) => AuthUserRemoteDataSource(networkService),
);

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    Dio dio = Dio();
    DioManager manager = DioManager(dio);

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: manager.onResponse,
      onRequest: manager.onRequest,
      onError: manager.onError,
    ));

    final AuthUserDataSource dataSource =
        ref.watch(authDataSourceProvider(manager));

    return AuthenticationRepositoryImpl(dataSource);
  },
);
