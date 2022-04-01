import 'package:fluent_query_builder/fluent_query_builder.dart';
import 'package:microservice/modules/users/entity/user.dart';

class UserRepository {
  DbLayer db;

  UserRepository(this.db);

  Future<List<User>> getAllUsers() {
    return db.select().from('users').fetchAll<User>();
  }
}