import 'package:dio/dio.dart';
import 'package:flutter_starter/core/constants/preferences.dart';
import 'package:flutter_starter/core/error/exceptions.dart';
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
  Future<bool> hasValidToken();
  Future<String?> refreshToken();
  Future<void> logout();
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
  Future<bool> hasValidToken() async {
    final token = await getAccessToken();
    if (token == null) return false;

    // Optional: Add JWT token expiration check
    // try {
    //   final jwt = JWT.decode(token);
    //   return !jwt.isExpired;
    // } catch (e) {
    //   return false;
    // }

    return true;
  }

  @override
  Future<String?> refreshToken() async {
    try {
      final currentRefreshToken = await getRefreshToken();

      if (currentRefreshToken == null) {
        throw UnauthorizedException('No refresh token available');
      }

      final response = await _dio.post(
        '/auth/refresh',
        data: {'refresh_token': currentRefreshToken},
      );

      final newAccessToken = response.data['access_token'] as String;
      final newRefreshToken = response.data['refresh_token'] as String?;

      await saveAccessToken(newAccessToken);
      if (newRefreshToken != null) {
        await saveRefreshToken(newRefreshToken);
      }

      return newAccessToken;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await logout();
        throw UnauthorizedException('Refresh token expired');
      }
      throw ServerException(e.message ?? 'Failed to refresh token');
    }
  }

  @override
  Future<void> logout() async {
    try {
      // Optional: Call logout endpoint
      final token = await getAccessToken();
      if (token != null) {
        await _dio.post(
          '/auth/logout',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
      }
    } catch (_) {
      // Ignore errors during logout
    } finally {
      await deleteTokens();
    }
  }
}
