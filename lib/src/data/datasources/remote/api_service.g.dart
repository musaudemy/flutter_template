// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'baseUrl';
  }
  final Dio _dio;

  String? baseUrl = '';

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////           ACCOUNT          ///////////////////////////
  // @override
  // Future<HttpResponse<UserCreateResponseModel>> createUser(register) async {
  //   const _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{r'format': 'json'};
  //   final _headers = <String, dynamic>{};
  //   final _data = <String, dynamic>{};
  //   _data.addAll(register.toJson());
  //   final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
  //       Options(method: 'POST', headers: _headers, extra: _extra)
  //           .compose(_dio.options, '${lang}/api/accounts/',
  //               queryParameters: queryParameters, data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = UserCreateResponseModel.fromJson(_result.data);
  //   final httpResponse = HttpResponse(value, _result);
  //   return httpResponse;
  // }

  // @override
  // Future<HttpResponse<UserReadModel>> updateUserAvatar(
  //     id, authHeader, avatar) async {
  //   const _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{r'format': 'json'};
  //   final _headers = <String, dynamic>{r'Authorization': authHeader};
  //   _headers.removeWhere((k, v) => v == null);
  //   final _data = FormData();
  //   _data.files.add(MapEntry(
  //       'avatar',
  //       MultipartFile.fromFileSync(avatar.path,
  //           filename: avatar.path.split(Platform.pathSeparator).last)));
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<HttpResponse<UserReadModel>>(Options(
  //               method: 'PATCH',
  //               headers: _headers,
  //               extra: _extra,
  //               contentType: 'multipart/form-data')
  //           .compose(_dio.options, '/api/accounts/${id}/',
  //               queryParameters: queryParameters, data: _data)
  //           .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = UserReadModel.fromJson(_result.data!);
  //   final httpResponse = HttpResponse(value, _result);
  //   return httpResponse;
  // }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
