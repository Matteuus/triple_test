import 'package:dio/dio.dart';

class Api {
  final Dio dio;
  static const DEFAULT_CONNECT_TIMEOUT = 5000;
  static const DEFAULT_RECEIVE_TIMEOUT = 3000;

  Api(this.dio) {
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
}
