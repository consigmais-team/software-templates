
import 'package:microservice/modules/users/entity/user.dart';
import 'package:microservice/modules/users/repository/user_repository.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:simple_logger/simple_logger.dart';

class UserService {
  UserRepository repository;

  SimpleLogger logger;

  UserService(this.repository, this.logger);

  Future<List<User>> getUsers() {
    logger.info('searching for users');
    return repository.getAllUsers();
  }
}