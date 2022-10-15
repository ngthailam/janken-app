import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logCurl(options);
    return super.onRequest(options, handler);
  }

  @override
  // ignore: always_specify_types
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('''RESPONSE[${response.statusCode}] => PATH: ${response.realUri.path}\n=>> Data: ${response.data}''');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('''ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}\n=>> ${err.response?.data}''');
    return super.onError(err, handler);
  }

  void _logCurl(RequestOptions options) {
    String curl = 'curl --location --request';
    curl += ' ${options.method} ';
    curl += '\'${options.uri.toString()}\'';
    curl += ' \\';
    curl += '--header ${options.headers} \\';
    curl += '--data-raw \'';
    curl += json.encode(options.data);
    curl += '\'';
    log(curl);
  }
}
