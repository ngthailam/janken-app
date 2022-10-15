import 'package:dio/dio.dart';
import 'package:janken_app/data/modules/auth/datasource/auth_local_ds.dart';
import 'package:janken_app/main.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final newOptions = options;
    newOptions.headers.remove('Authorization');
    final accessToken = getIt<AuthLocalDataSource>().accessToken;
    newOptions.headers
        .putIfAbsent('Authorization', () => 'Bearer $accessToken');
    return handler.next(newOptions);
  }
}
