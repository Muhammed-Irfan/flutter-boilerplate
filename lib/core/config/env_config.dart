import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  dev,
  staging,
  prod,
}

class EnvConfig {
  final String baseUrl;
  final Flavor flavor;
  final bool enableLogging;

  const EnvConfig._({
    required this.baseUrl,
    required this.flavor,
    required this.enableLogging,
  });

  static Future<EnvConfig> fromEnvironment(Flavor environment) async {
    final flavor = environment;
    final envFile = '.${flavor.name}.env';
    await dotenv.load(fileName: envFile);

    return EnvConfig._(
      baseUrl: dotenv.get('API_BASE_URL'),
      flavor: flavor,
      enableLogging: flavor != Flavor.prod,
    );
  }

  bool get isDevelopment => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProduction => flavor == Flavor.prod;
}
