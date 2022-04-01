import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => 'https://users.consigmais.com.br';

  @override
  String get apiPath => '/users';

  @override
  String get pingEndpoint => 'http://consigmais.com.br/ping';
}
