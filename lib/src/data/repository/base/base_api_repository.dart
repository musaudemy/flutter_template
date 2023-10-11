import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:tmtrade_sms/src/data/repository/base/data_state.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiRepository {
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `DataState`.
  ///
  /// Returns `DataSuccess` that holds the generic data `T` if the response
  /// is successfully recieved.
  ///
  /// Returns `DataFailed` that holds a `DioError` instance if any error occurs
  /// while sending the request or recieving the response.
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
    int httpStatus = HttpStatus.ok,
  }) async {
    try {
      final httpResponse = await request();
      print('-------------------from repository----------------');
      print(httpResponse);
      if (httpResponse.response.statusCode == httpStatus) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch (error) {
      print('-------------------from repository error ----------------');
      print(error);
      return DataFailed(error);
    }
  }
}
