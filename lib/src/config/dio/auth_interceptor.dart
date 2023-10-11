import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/config/dio/app_interceptor.dart';
import 'dio_client.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Auth? auth = injector<StorageRepository>.call().getAuth();

    // if (auth != null && auth.accessToken.isNotEmpty) {
    //   options.headers.putIfAbsent(
    //     HttpHeaders.authorizationHeader,
    //     () => 'Bearer ${auth.accessToken}',
    //   );
    // } else {}
    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final option = err.requestOptions;

    if (err is UnauthorizedException) {
      //   Auth? auth = injector<StorageRepository>.call().getAuth();
      //   if (auth != null) {
      //     try {
      //       String server = auth.server;
      //       final body = {
      //         'refresh_token': auth.refreshToken,
      //       };

      //       final response = await dio.post(
      //         '$server/auth/connect/token',
      //         options: Options(
      //           contentType: "application/x-www-form-urlencoded",
      //         ),
      //         data: body,
      //       );

      //       final data = response.data as Map<String, dynamic>;

      //       final result = AuthResponse.fromJson(data);

      //       auth.accessToken = result.accessToken;
      //       auth.refreshToken = result.refreshToken;
      //       await auth.save();

      //       // await Hive.box('auth').put('accessToken', result.accessToken);
      //       // await Hive.box('auth').put('refreshToken', result.refreshToken);
      //       option.headers.clear();

      //       option.headers.putIfAbsent(
      //         HttpHeaders.authorizationHeader,
      //         () => 'Bearer ${result.accessToken}',
      //       );

      //       try {
      //         final a = await dio.fetch(option);

      //         return handler.resolve(a);
      //       } on DioError catch (e) {
      //         return handler.reject(e);
      //       }
      //     } catch (e) {
      //       // implement logout
      //       if (navigatorKey.currentContext != null) {
      //         BlocProvider.of<AuthBloc>(navigatorKey.currentContext!)
      //             .add(const LoginReload(true));
      //         await navigatorKey.currentState?.pushNamed(AppRoute.auth);
      //       }
      //     }
      //   }
    }

    return handler.next(err);
  }
}
