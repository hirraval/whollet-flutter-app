import 'dart:io';

import 'package:data/src/interceptors/auth_interceptor.dart';
import 'package:data/src/preference/app_preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:network/network.dart' hide AuthInterceptor;
import 'package:path_provider/path_provider.dart';
import 'package:whollet_environment/whollet_environment.dart';

@module
abstract class NetworkModule {
  final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    headers: {
      HttpHeaders.acceptHeader: Headers.jsonContentType,
      HttpHeaders.contentTypeHeader: Headers.jsonContentType,
    },
  );

  @singleton
  @preResolve
  Future<CacheService> providesCacheService() async {
    final CacheService service;
    String? storagePath;
    if (!kIsWeb) storagePath = await getTemporaryDirectory().then((value) => value.path);
    service = StorageCacheService(storagePath: storagePath);
    await service.init();
    return service;
  }

  @singleton
  Dio providesDioInstance({required AppPreference preference, required WholletEnvironment environment}) {
    final baseOptions = _baseOptions.copyWith(baseUrl: environment.baseApi);
    final dio = Dio(baseOptions);
    final refreshDio = Dio(baseOptions);

    final encryptionInterceptor = EncryptionInterceptor(
      encryptionKey: environment.encryption.encryptionKey,
      encryptionIv: environment.encryption.encryptionIv,
      decryptionKey: environment.encryption.decryptionKey,
      decryptionIv: environment.encryption.decryptionIv,
      logEnabled: environment.isLogEnabled,
    );
    final loggingInterceptor = LoggingInterceptor();

    refreshDio.interceptors.addAll([
      if (environment.isLogEnabled) loggingInterceptor,
      encryptionInterceptor,
    ]);
    dio.interceptors.addAll([
      AuthInterceptor(preference: preference, dio: refreshDio),
      if (environment.isLogEnabled) loggingInterceptor,
      encryptionInterceptor,
    ]);
    return dio;
  }
}
