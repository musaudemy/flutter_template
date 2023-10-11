import 'package:flutter_template/src/data/repository/base/data_state.dart';
import 'package:flutter_template/src/domain/models/requests/auth_request.dart';
import 'package:flutter_template/src/domain/models/responses/auth_response.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponse>> userLogin({
    required AuthRequest request,
  });
  Future<DataState<AuthResponse>> tokenRefresh({
    required AuthRequest request,
  });
}
