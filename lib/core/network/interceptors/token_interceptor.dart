//ignore_for_file: avoid_void_async

import 'package:dio/dio.dart';
import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/services/auth/token_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class TokenInterceptor extends Interceptor {
  final TokenService _tokenService;
  bool _isRefreshing = false;
  final _pendingRequests = <RequestOptions, ErrorInterceptorHandler>{};

  TokenInterceptor(this._tokenService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenService.getAccessToken();

    //Add bearer token
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        if (!_isRefreshing) {
          _isRefreshing = true;

          if (!await _tokenService.hasValidToken()) {
            throw UnauthorizedException();
          }

          final newToken = await _tokenService.refreshToken();
          if (newToken != null) {
            // Retry original request
            final response = await _retryRequest(err.requestOptions, newToken);
            handler.resolve(response);

            // Process pending requests
            await _processPendingRequests(newToken);
          }
        } else {
          // Queue the request
          _pendingRequests[err.requestOptions] = handler;
        }
      } on UnauthorizedException {
        await _tokenService.logout();
        handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions requestOptions,
    String newToken,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $newToken',
      },
    );

    return Dio().request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> _processPendingRequests(String newToken) async {
    final requests = Map<RequestOptions, ErrorInterceptorHandler>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final entry in requests.entries) {
      try {
        final response = await _retryRequest(entry.key, newToken);
        entry.value.resolve(response);
      } catch (e) {
        entry.value.reject(
          DioException(
            requestOptions: entry.key,
            error: e,
          ),
        );
      }
    }
  }
}
