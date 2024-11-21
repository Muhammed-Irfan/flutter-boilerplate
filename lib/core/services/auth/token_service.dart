import 'package:dio/dio.dart';
import 'package:flutter_starter/core/constants/preferences.dart';
import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/network/api_endpoints.dart';
import 'package:flutter_starter/core/services/storage/storage_service_provider.dart';
import 'package:injectable/injectable.dart';

abstract class TokenService {
  // Token Management
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> deleteTokens();

  // Token Operations
  Future<String?> refreshToken();
  Future<Map<String, dynamic>> setBearerToken();
}

@Singleton(as: TokenService)
class TokenServiceImpl implements TokenService {
  final Dio _dio;
  final StorageServiceProvider _storageService;

  TokenServiceImpl(@Named('token-dio') this._dio, this._storageService);

  @override
  Future<void> saveAccessToken(String token) async {
    await _storageService.saveSecureToken(Preferences.accessToken, token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _storageService.saveSecureToken(Preferences.refreshToken, token);
  }

  @override
  Future<String?> getAccessToken() async {
    return _storageService.getSecureToken(Preferences.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storageService.getSecureToken(Preferences.refreshToken);
  }

  @override
  Future<void> deleteTokens() async {
    await _storageService.deleteSecureTokens();
  }

  @override
  Future<String?> refreshToken() async {
    try {
      final currentRefreshToken = await getRefreshToken();

      if (currentRefreshToken == null) {
        throw UnauthorizedException();
      }

      final response = await _dio.post(
        ApiEndpoints.authRefresh,
        data: {'refresh_token': currentRefreshToken},
      );

      final newAccessToken = response.data['access_token'] as String;
      final newRefreshToken = response.data['refresh_token'] as String?;

      await saveAccessToken(newAccessToken);
      if (newRefreshToken != null) {
        await saveRefreshToken(newRefreshToken);
      }

      return newAccessToken;
    } catch (e) {
      throw UnauthorizedException('Failed to refresh token');
    }
  }

  @override
  Future<Map<String, dynamic>> setBearerToken() async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      return {};
    }

    return {
      'Authorization': 'Bearer $accessToken',
    };
  }
}
