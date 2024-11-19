import 'package:dio/dio.dart';
import 'package:flutter_starter/core/config/env_config.dart';
import 'package:flutter_starter/core/network/dio_client.dart';
import 'package:flutter_starter/core/network/interceptors/logging_interceptor.dart';
import 'package:flutter_starter/core/network/interceptors/token_interceptor.dart';
import 'package:flutter_starter/core/services/logging/logging_service.dart';
import 'package:flutter_starter/core/utils/parse_error_logger.dart';
import 'package:flutter_starter/features/posts/data/datasources/remote/post_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @preResolve
  @injectable
  @Named('token-dio')
  Future<Dio> loadTokenRefreshDio({
    required EnvConfig config,
    required LoggingService talkerService,
  }) async {
    final dio = Dio(BaseOptions(baseUrl: config.baseUrl));
    if (!config.isProduction) {
      dio.interceptors.add(
        loggingInterceptor(talkerService),
      );
    }
    return dio;
  }

  @singleton
  @preResolve
  Future<Dio> dio(EnvConfig config, TokenInterceptor authInterceptor,
          LoggingService talkerService,) async =>
      createDio(config, authInterceptor, talkerService);

  @singleton
  PostsApiClient someApiClient(Dio dio, EnvConfig config) => PostsApiClient(
        dio,
        baseUrl: config.baseUrl,
        errorLogger: CustomParseErrorLogger(),
      );
}
