import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fetch/core/apis/api_auth.dart';
import 'package:fetch/core/apis/api_endpoints.dart';
import 'package:fetch/core/exception/app_exception.dart';
import 'package:fetch/core/storage/database.dart';
import 'package:fetch/core/storage/storage.dart';


Future<String> reAuth(Dio dio) async {
  final authData = getStorage(path: DB.TOKEN);

  if (authData != null) {
    try {
      final response = await dio.post(
        refreshTokenUrl,
        data: {
          'refreshToken': authData['refreshToken'],
        },
      );

      if (response.statusCode == 200) {
        // Update your access token with the new token
        final accessToken = response.data['accessToken'];

        setStorage(
          key: DB.TOKEN,
          value: {
            "accessToken": accessToken,
            "refreshToken": authData['refreshToken']
          },
        );

        return accessToken;
      } else {
        log('Token Refresh failed');

        // Handle token refresh failure
        throw UnAuthenticatedException(message: 'Token refresh failed');
      }
    } catch (e) {
      // Handle network or other errors
      rethrow;
    }
  } else {
    throw UnAuthenticatedException();
  }
}

class DioManager {
  final Dio dio;

  DioManager(this.dio);

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // pp(options.headers);

    dio.options.headers = options.headers;
    handler.next(options);
  }

  void onResponse(options, ResponseInterceptorHandler handler) async {
    // pp(options.statusCode);
    handler.resolve(options);
  }

  void onError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 401) {
      try {
        // Refresh the token
        final accessToken = await reAuth(dio);

        // Retry the original request
        final originalRequest = e.requestOptions;

        final response = await dio.request(
          originalRequest.path,
          data: originalRequest.data,
          options: Options(
            headers: headers
              ..['Content-type'] = originalRequest.headers['Content-type']
              ..['Authorization'] = 'Bearer $accessToken',
          ),
        );

        handler.resolve(response);
      } catch (exception) {
        handler.reject(e);
      }
    } else {
      log('$e');
      if (e.response?.statusCode == 503) {
        handler.reject(e);
      } else if (e.error == null) {
        handler.resolve(
          e.response ??
              Response(
                data: {'message': ''},
                requestOptions: RequestOptions(),
              ),
        );
      } else {
        handler.reject(e);
      }
    }
  }
}
