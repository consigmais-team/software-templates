import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => 'http://localhost:8080';

  @override
  String get apiPath => '/users';

  @override
  String get pingEndpoint => 'http://localhost/ping';
}
