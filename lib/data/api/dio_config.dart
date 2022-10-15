import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:janken_app/data/api/alice_config.dart';
import 'package:janken_app/data/api/const.dart';
import 'package:janken_app/data/api/interceptors/auth_interceptor.dart';
import 'package:janken_app/data/api/interceptors/logging_interceptor.dart';
import 'package:janken_app/main.dart';

Dio getDioConfig() {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConst.baseUrl,
    connectTimeout: ApiConst.connectTimeoutMillis,
    receiveTimeout: ApiConst.receiveTimeoutMillis,
    headers: ApiConst.headers,
  ));

  dio.interceptors.add(AuthInterceptor());

  if (kDebugMode) {
    dio.interceptors
      ..add(LoggingInterceptor())
      ..add(getIt<AliceConfig>().instance.getDioInterceptor());
  }
  return dio;
}
