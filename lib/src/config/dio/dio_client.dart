import 'dart:developer';
import 'dart:io';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'app_interceptor.dart';
import 'auth_interceptor.dart';

final dio = Dio();

class DioClient {
  static Dio createDio() {
    dio.interceptors.addAll({
      AppInterceptors(),
      AuthInterceptor(),
      AwesomeDioInterceptor(),
    });

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  DioClient._internal();

  static final _singleton = DioClient._internal();

  factory DioClient() => _singleton;
}
