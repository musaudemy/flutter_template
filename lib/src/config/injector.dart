import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/src/config/dio/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = DioClient.createDio();
  // final hive = HiveClient();
  final sharedPreference = await SharedPreferences.getInstance();

  injector.registerSingleton<SharedPreferences>(sharedPreference);
  injector.registerSingleton<Dio>(dio);

  injector.registerSingleton<Connectivity>(Connectivity());

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////////            API             ///////////////////////////
  // injector.registerSingleton<ApiService>(
  //     ApiService(injector(), injector(), baseUrl: hosts['baseUrl']));
}
