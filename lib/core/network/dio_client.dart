import 'package:dio/dio.dart';
import 'package:flutter_starter/core/config/env_config.dart';
import 'package:flutter_starter/core/network/interceptors/error_interceptor.dart';
import 'package:flutter_starter/core/network/interceptors/logging_interceptor.dart';
import 'package:flutter_starter/core/network/interceptors/token_interceptor.dart';
import 'package:flutter_starter/core/services/logging/logging_service.dart';

Dio createDio(
  EnvConfig config,
  TokenInterceptor authInterceptor,
  LoggingService talkerService,
) {
  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // Add interceptors in specific order
  dio.interceptors.addAll([
    if (!config.isProduction) loggingInterceptor(talkerService), // Log first
    authInterceptor, // Handle token refresh
    ErrorInterceptor(), // Handle other errors
  ]);

  return dio;
}
