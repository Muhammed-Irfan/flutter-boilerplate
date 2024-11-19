import 'package:flutter_starter/core/config/env_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EnvModule {
  @dev
  @preResolve
  @singleton
  Future<EnvConfig> devConfig() => EnvConfig.fromEnvironment(Flavor.dev);

  @test
  @preResolve
  @singleton
  Future<EnvConfig> stagingConfig() => EnvConfig.fromEnvironment(Flavor.staging);

  @prod
  @preResolve
  @singleton
  Future<EnvConfig> prodConfig() => EnvConfig.fromEnvironment(Flavor.prod);
}
