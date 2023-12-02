import 'dart:io' as io;

import 'package:data/src/preference/app_preference.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';

class AuthInterceptor extends QueuedInterceptor {
  final AppPreference preference;
  final Dio _refreshDio;

  AuthInterceptor({
    required this.preference,
    required Dio dio,
  }) : _refreshDio = dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = preference.accessToken?.accessToken;
    if (accessToken?.isNotEmpty ?? false) {
      options.headers[io.HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse && err.response?.statusCode == 401) {
      final accessToken = preference.accessToken;
      final requestAccessToken =
          err.requestOptions.headers[io.HttpHeaders.authorizationHeader]?.toString().split(" ").last;
      if (accessToken != null) {
        try {
          if (accessToken.accessToken == requestAccessToken) await _refreshToken(accessToken.refreshToken);
          return handler.reject(DioException(
            type: DioExceptionType.unknown,
            requestOptions: err.requestOptions,
            error: const TokenExpiredException(),
          ));
        } on DioException catch (dioError) {
          return handler.next(dioError);
        } catch (error) {
          return handler
              .reject(DioException(type: DioExceptionType.unknown, requestOptions: err.requestOptions, error: error));
        }
      }
    }
    super.onError(err, handler);
  }

  Future<void> _refreshToken(String refreshToken) async {
    try {
      final request = ApiRequest<dynamic>(
        RequestType.get,
        "user/refresh/token",
        headers: {io.HttpHeaders.authorizationHeader: "Bearer $refreshToken"},
      );
      final response = await request.fetch(_refreshDio);
      preference.accessToken = TokenData(
        accessToken: response.data["accessToken"],
        refreshToken: response.data["refreshToken"],
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse && error.response?.statusCode == 422) return;
      rethrow;
    }
  }
}
