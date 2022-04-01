import 'dart:async';

import 'package:fluent_query_builder/fluent_query_builder.dart';
import 'package:microservice/microservice_module.dart';
import 'package:microservice/modules/users/entity/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf_test_handler/shelf_test_handler.dart';
import 'package:test/test.dart';

import 'users_test.mocks.dart';

@GenerateMocks([DbLayer])
@GenerateMocks([QueryBuilder])
void main() {

  final db = MockDbLayer();
  final qb = MockQueryBuilder();

  setUp() {
    initModule(MicroserviceModule(), replaceBinds: [
      Bind.instance<DbLayer>(db),
    ]);
  }

  test('test should list users', () async {
    when(db.select()).thenReturn(qb);
    when(qb.from('users')).thenReturn(qb);
    when(qb.fetchAll<User>())
      .thenAnswer((realInvocation) => Future.value([User('john doe')]));

    var server = await ShelfTestServer.create();

    server.handler.expect('GET', '/users/', (request) async {
      expect(await request.readAsString(), equals("[{'id':null,name:'john doe'}]"));

      return Response.ok('');
    });
  });
}