import 'dart:io';

class ApiConst {
  static String baseUrl =
      "http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/";
  static const int connectTimeoutMillis = 30000;
  static const int receiveTimeoutMillis = 30000;
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
}
