import 'dart:convert';

import 'package:microservice/modules/users/service/user_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class UserResource extends Resource {
  UserService get service => Modular.get<UserService>();

  @override
  List<Route> get routes => [
    Route.get('/', listUsers),
  ];

  Future<Response> listUsers(Request request) async {
    return Response.ok(json.encode(await service.getUsers()));
  }
}