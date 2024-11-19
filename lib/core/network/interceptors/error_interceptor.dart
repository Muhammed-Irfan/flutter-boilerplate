import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter/core/error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.cancel:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ServerException('Request to API server was cancelled'),
          ),
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: TimeOutException('Timeout with API server'),
          ),
        );
      case DioExceptionType.badResponse:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: _handleBadResponse(err),
          ),
        );
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              error: NetworkException('No internet connection'),
            ),
          );
        }
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: UnknownAPIException('Unknown error occurred'),
          ),
        );
      default:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: UnknownAPIException('Unknown error occurred'),
          ),
        );
    }
  }

  AppException _handleBadResponse(DioException err) {
    if (err.response != null) {
      switch (err.response!.statusCode) {
        case 400:
        case 422:
          return BadRequestException(
            err.response?.data?['message'] ?? 'Bad request',
          );
        case 401:
          return UnauthorizedException(
            err.response?.data?['message'] ?? 'Unauthorized',
          );
        case 403:
          return ForbiddenException(
            err.response?.data?['message'] ?? 'Forbidden',
          );
        case 404:
          return NotFoundException(
            err.response?.data?['message'] ?? 'Not found',
          );
        default:
          return ServerException('Server error: ${err.response!.statusCode}');
      }
    }
    return ServerException('Received invalid response: ${err.message}');
  }
}
