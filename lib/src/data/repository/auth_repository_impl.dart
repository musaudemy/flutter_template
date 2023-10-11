import 'package:flutter_template/src/data/datasources/remote/api_service.dart';
import 'package:flutter_template/src/data/repository/base/data_state.dart';
import 'package:flutter_template/src/domain/models/requests/auth_request.dart';
import 'package:flutter_template/src/domain/models/responses/auth_response.dart';
import 'package:flutter_template/src/domain/repository/auth_repository.dart';

import 'base/base_api_repository.dart';

// class AuthRepositoryImpl extends BaseApiRepository implements AuthRepository {
//   final ApiService _apiService;
//   AuthRepositoryImpl(this._apiService);
// 
//   @override
//   Future<DataState<AuthResponse>> userLogin({
//     required AuthRequest request,
//   }) {
//     return getStateOf<AuthResponse>(
//         request: () => _apiService.userLogin(request));
//   }
// 
//   @override
//   Future<DataState<AuthResponse>> tokenRefresh({
//     required AuthRequest request,
//   }) {
//     return getStateOf<AuthResponse>(
//         request: () => _apiService.userLogin(request));
//   }
// 
// }
// 