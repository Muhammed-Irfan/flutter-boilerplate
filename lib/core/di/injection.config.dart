// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/posts/data/datasources/remote/post_api_client.dart'
    as _i1048;
import '../../features/posts/data/datasources/remote/posts_remote_datasource.dart'
    as _i59;
import '../../features/posts/data/repositories/posts_repository_impl.dart'
    as _i675;
import '../../features/posts/domain/repositories/posts_repository.dart'
    as _i245;
import '../../features/posts/domain/usecases/get_post_details.dart' as _i785;
import '../../features/posts/domain/usecases/get_posts.dart' as _i1032;
import '../../features/posts/presentation/bloc/posts_detail/post_details_bloc.dart'
    as _i157;
import '../../features/posts/presentation/bloc/posts_list/post_bloc.dart'
    as _i536;
import '../config/env_config.dart' as _i373;
import '../network/interceptors/token_interceptor.dart' as _i338;
import '../services/auth/token_service.dart' as _i463;
import '../services/logging/logging_service.dart' as _i1022;
import '../services/storage/storage_service.dart' as _i968;
import '../services/storage/storage_service_provider.dart' as _i576;
import 'modules/env_module.dart' as _i955;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i148;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final envModule = _$EnvModule();
  final networkModule = _$NetworkModule();
  await gh.singletonAsync<_i460.SharedPreferencesWithCache>(
    () => storageModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i558.FlutterSecureStorage>(() => storageModule.secureStorage);
  await gh.singletonAsync<_i373.EnvConfig>(
    () => envModule.devConfig(),
    registerFor: {_dev},
    preResolve: true,
  );
  await gh.singletonAsync<_i373.EnvConfig>(
    () => envModule.stagingConfig(),
    registerFor: {_test},
    preResolve: true,
  );
  gh.singleton<_i576.StorageServiceProvider>(
      () => _i576.StorageServiceProviderImpl(
            gh<_i558.FlutterSecureStorage>(),
            gh<_i460.SharedPreferencesWithCache>(),
          ));
  await gh.singletonAsync<_i373.EnvConfig>(
    () => envModule.prodConfig(),
    registerFor: {_prod},
    preResolve: true,
  );
  gh.singleton<_i1022.LoggingService>(
      () => _i1022.LoggingService(gh<_i373.EnvConfig>()));
  gh.factory<_i968.StorageService>(
      () => _i968.StorageServiceImpl(gh<_i576.StorageServiceProvider>()));
  await gh.factoryAsync<_i361.Dio>(
    () => networkModule.loadTokenRefreshDio(
      config: gh<_i373.EnvConfig>(),
      talkerService: gh<_i1022.LoggingService>(),
    ),
    instanceName: 'token-dio',
    preResolve: true,
  );
  gh.singleton<_i463.TokenService>(() => _i463.TokenServiceImpl(
        gh<_i361.Dio>(instanceName: 'token-dio'),
        gh<_i576.StorageServiceProvider>(),
      ));
  gh.singleton<_i338.TokenInterceptor>(
      () => _i338.TokenInterceptor(gh<_i463.TokenService>()));
  await gh.singletonAsync<_i361.Dio>(
    () => networkModule.dio(
      gh<_i373.EnvConfig>(),
      gh<_i338.TokenInterceptor>(),
      gh<_i1022.LoggingService>(),
    ),
    preResolve: true,
  );
  gh.singleton<_i1048.PostsApiClient>(() => networkModule.someApiClient(
        gh<_i361.Dio>(),
        gh<_i373.EnvConfig>(),
      ));
  gh.factory<_i59.PostsRemoteDataSource>(
      () => _i59.PostsRemoteDataSourceImpl(gh<_i1048.PostsApiClient>()));
  gh.factory<_i245.PostsRepository>(
      () => _i675.PostsRepositoryImpl(gh<_i59.PostsRemoteDataSource>()));
  gh.factory<_i785.GetPostDetails>(
      () => _i785.GetPostDetails(gh<_i245.PostsRepository>()));
  gh.factory<_i1032.GetPosts>(
      () => _i1032.GetPosts(gh<_i245.PostsRepository>()));
  gh.factory<_i157.PostDetailsBloc>(
      () => _i157.PostDetailsBloc(gh<_i785.GetPostDetails>()));
  gh.factory<_i536.PostsBloc>(() => _i536.PostsBloc(gh<_i1032.GetPosts>()));
  return getIt;
}

class _$StorageModule extends _i148.StorageModule {}

class _$EnvModule extends _i955.EnvModule {}

class _$NetworkModule extends _i851.NetworkModule {}
