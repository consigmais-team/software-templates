import 'base_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      default:
        return DevConfig();
    }
  }
}
