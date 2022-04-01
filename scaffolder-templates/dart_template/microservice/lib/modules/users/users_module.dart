import 'package:microservice/modules/users/controller/user_resource.dart';
import 'package:microservice/modules/users/repository/user_repository.dart';
import 'package:microservice/modules/users/service/user_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class UsersModule extends Module {
  @override
  List<Bind> get binds =>
      [
        Bind.singleton((i) => UserRepository(i())),
        Bind.singleton((i) => UserService(i(), i())),
      ];

  @override
  List<Route> get routes => [
    Route.get('/health-check', handleHealthCheck),
    Route.resource('/', resource: UserResource())
  ];

  Future<Response> handleHealthCheck(ModularArguments args) async {
    try {
      return Response.ok('healthCheck type: ${args.params['type']}');
    } catch (e) {
      return Response.internalServerError();
    }
  }
}