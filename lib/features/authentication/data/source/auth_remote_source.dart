import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:fetch/core/apis/api_auth.dart';
import 'package:fetch/core/apis/api_endpoints.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/core/services/dio/dio_manager.dart';
import 'package:fetch/core/storage/database.dart';
import 'package:fetch/core/storage/dispatch.dart';
import 'package:fetch/core/storage/storage.dart';
import 'package:fetch/features/authentication/data/model/user.model.dart';

abstract class AuthUserDataSource {
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

class AuthUserRemoteDataSource implements AuthUserDataSource {
  final DioManager manager;

  AuthUserRemoteDataSource(this.manager);

  @override
  Future<Either<AppException, UserModel>> updateUser({
    required String fullname,
  }) async {
    try {
      if (getUser == null) {
        throw (Exception('User not found'));
      }
      UserModel model = getUser!.copyWith(firstName: fullname);
      return Right(model);
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 1,
          identifier: 'Auth.login',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, UserModel>> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      // something

      final result = await manager.dio
          .post(loginUrl, options: Options(headers: headers), data: {
        'username': username,
        'password': password,
      });
      log(result.statusMessage.toString());
      if (result.statusCode == 200) {
        return Right(UserModel.fromMap(result.data));
      }

      throw (Exception(result.data['message']));
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 1,
          identifier: 'Auth.login',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, UserModel>> registerUser({
    required String username,
    required String password,
  }) async {
    try {
      final result = await manager.dio
          .post(registerUrl, options: Options(headers: headers), data: {
        'username': username,
        'password': password,
      });

      if (result.statusCode == 200) {
        setStorage(key: DB.TOKEN, value: {
          "accessToken": result.data['accessToken'],
          "refreshToken": result.data['refreshToken']
        });

        setStorage(key: DB.USER, value: (result.data));

        return Right(UserModel.fromMap(result.data));
      }

      throw (Exception(result.data['message']));
    } catch (e) {
      return Left(
        AppException(
          message: e.toString(),
          statusCode: 1,
          identifier: 'Auth.register',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, UserModel>> getMe() async {
    try {
      // something
      final result =
          await manager.dio.get(loginUrl, options: Options(headers: headers));
      log(result.statusMessage.toString());
      if (result.statusCode == 200) {
        return Right(UserModel.fromMap(result.data));
      }

      throw (Exception(result.data['message']));
    } catch (e) {
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
