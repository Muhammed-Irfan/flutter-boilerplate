//ignore_for_file: avoid_void_async

import 'package:dio/dio.dart';
import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/events/auth_events.dart';
import 'package:flutter_starter/core/network/api_endpoints.dart';
import 'package:flutter_starter/core/services/auth/token_service.dart';
import 'package:flutter_starter/core/utils/event_bus.dart';
import 'package:injectable/injectable.dart';

@singleton
class TokenInterceptor extends Interceptor {
  final TokenService _tokenService;
  final EventBus _eventBus;

  bool _isRefreshing = false;
  final _pendingRequests = <RequestOptions, ErrorInterceptorHandler>{};

  TokenInterceptor(this._tokenService, this._eventBus);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip token for auth endpoints
    if (_isAuthEndpoint(options.path)) {
      return handler.next(options);
    }

    // Add token to headers if available
    options.headers.addAll(await _tokenService.setBearerToken());
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isAuthEndpoint(err.requestOptions.path)) {
      try {
        if (!_isRefreshing) {
          _isRefreshing = true;

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
        _eventBus.fire(
          const SessionExpiredEvent(
            reason: 'Session expired. Please login again.',
          ),
        );
        _rejectPendingRequests();
        handler.next(err);
      } catch (error) {
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: AppException.fromException(error),
          ),
        );
      } finally {
        _isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  bool _isAuthEndpoint(String path) {
    final authPaths = [
      //ApiEndpoints.login,
      ApiEndpoints.authRefresh,
    ];
    return authPaths.any((endpoint) => path.contains(endpoint));
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

  void _rejectPendingRequests() {
    final requests = Map<RequestOptions, ErrorInterceptorHandler>.from(_pendingRequests);
    _pendingRequests.clear();

    for (final entry in requests.entries) {
      entry.value.reject(
        DioException(
          requestOptions: entry.key,
          error: UnauthorizedException('Session expired. Please login again.'),
        ),
      );
    }
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
