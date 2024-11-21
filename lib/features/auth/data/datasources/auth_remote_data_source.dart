import 'package:dio/dio.dart';
import 'package:flutter_starter/core/network/api_endpoints.dart';
import 'package:flutter_starter/core/services/auth/token_service.dart';
import 'package:flutter_starter/core/types/result.dart';
import 'package:flutter_starter/core/utils/safety_utils.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<Result<void>> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  final TokenService _tokenService;

  AuthRemoteDataSourceImpl(@Named('token-dio') this._dio, this._tokenService);

  @override
  Future<Result<void>> logout() async {
    return executeSafely(() async {
      final token = await _tokenService.getAccessToken();
      if (token != null) {
        await _dio.post(
          ApiEndpoints.logout,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
      }
    });
  }
}
