import 'dart:io';

import 'package:dotenv/dotenv.dart' show load;
import 'package:microservice/microservice_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_modular/shelf_modular.dart';

void main(List<String> args) async {
  // Load environment variables
  load();
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final modular = Modular(module: MicroserviceModule());
  final pipeline = Pipeline().addMiddleware(logRequests()).addHandler(modular);

  final server = await serve(pipeline, ip, port);

  print('Server started: ${server.address.address}:${server.port}');
}
