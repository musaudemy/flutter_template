import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("REQUEST[${options.method}] => PATH: ${options.baseUrl}"
        "=> REQUEST VALUES: ${options.queryParameters} => HEADERS: ${options.headers}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 403:
            throw UnauthorizedException(err.requestOptions);
          case 302:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        print('111111111111111111111111111111111111111111111111111');
        print(err);
        print(err.requestOptions);
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  // @override
  // String toString() {
  //   return '[400] неверный запрос';
  // }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  // @override
  // String toString() {
  //   return '[500] Произошла неизвестная ошибка, повторите попытку позже.';
  // }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  // @override
  // String toString() {
  //   return '[409] Произошел конфликт';
  // }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  // @override
  // String toString() {
  //   return '[401] В доступе отказано';
  // }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  // @override
  // String toString() {
  //   return '[404] Запрошенная информация не найдена';
  // }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r) {
    print(r);
  }

  @override
  String toString() {
    print('2222222222222222222222222222222222222222222222222222222');
    print(requestOptions.data);
    print(requestOptions.uri);
    print(requestOptions.baseUrl);
    print(requestOptions.cancelToken);
    return 'Интернет-соединение не обнаружено, попробуйте еще раз.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  // @override
  // String toString() {
  //   return 'Время ожидания соединения истекло, попробуйте еще раз.';
  // }
}
