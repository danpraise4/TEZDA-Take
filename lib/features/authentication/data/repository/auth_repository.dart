import 'package:either_dart/either.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/features/authentication/data/model/user.model.dart';
import 'package:fetch/features/authentication/data/source/auth_remote_source.dart';
import 'package:fetch/features/authentication/domain/repositories/domain_auth_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, UserModel>> loginUser({
    required String username,
    required String password,
  }) {
    return dataSource.loginUser(username: username, password: password);
  }

  @override
  Future<Either<AppException, UserModel>> registerUser({
    required String username,
    required String password,
  }) {
    return dataSource.registerUser(username: username, password: password);
  }

  @override
  Future<Either<AppException, UserModel>> getMe() {
    return dataSource.getMe();
  }

  @override
  Future<Either<AppException, UserModel>> updateUser({
    required String fullname,
  }) {
    return dataSource.updateUser(fullname: fullname);
  }
}
