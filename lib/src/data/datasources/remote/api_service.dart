import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'hostUrl')
@Headers({"Accept-Encoding": "gzip"})
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////            ACCOUNT         ///////////////////////////
  // @POST('{lang}/api/accounts/')
  // Future<HttpResponse<UserCreateResponseModel>> createUser(
  //     @Body() UserCreateParams register);

  // @PATCH('/api/accounts/{id}/')
  // @MultiPart()
  // Future<HttpResponse<UserReadModel>> updateUserAvatar(
  //   @Path('id') int id,
  //   @Header('Authorization') String authHeader,
  //   @Part(name: 'avatar') File avatar,
  // );
}
