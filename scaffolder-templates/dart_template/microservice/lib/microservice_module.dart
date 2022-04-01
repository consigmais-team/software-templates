import 'dart:io';

import 'package:dotenv/dotenv.dart' as dot;
import 'package:fluent_query_builder/fluent_query_builder.dart';
import 'package:microservice/modules/users/entity/user.dart';
import 'package:microservice/modules/users/users_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:simple_logger/simple_logger.dart';

class MicroserviceModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => SimpleLogger()),
    Bind.singleton((i) => DBConnectionInfo(
      driver: ConnectionDriver.pgsql,
      host: dot.env['DB_HOST'] as String,
      port: int.parse(dot.env['DB_PORT'] as String),
      username: dot.env['DB_USER'] as String,
      password: dot.env['DB_PASSWORD'] as String,
      database: dot.env['DB_DATABASE'] as String,
    )),
    Bind.factory(
      (i) {
        var db = DbLayer(
          factories: [
            {User: (x) => User.fromJson(x)}
          ]
        );

        db.connect(i());

        return db;
      }
    )
  ];

  MicroserviceModule();

  @override
  List<ModularRoute> get routes => [
    Route.get('/', () => Response.ok('Microservice is running!')),
    Route.module('/users/', module: UsersModule()),
  ];
}