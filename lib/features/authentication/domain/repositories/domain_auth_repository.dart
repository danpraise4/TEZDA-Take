import 'package:either_dart/either.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/features/authentication/data/model/user.model.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, UserModel>> loginUser({
    required String username,
    required String password,
  });


  Future<Either<AppException, UserModel>> registerUser({
    required String username,
    required String password,
  });

  Future<Either<AppException, UserModel>> updateUser({
    required String fullname,
  });


  Future<Either<AppException, UserModel>> getMe();
}
