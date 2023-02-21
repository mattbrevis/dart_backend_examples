import 'package:shelf/shelf.dart';

import 'infra/my_server.dart';
import 'api/server_handler.dart';
import 'utils/custom_env.dart';

void main() async {   
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(ServeHandler.handler);
  await MyServer.initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
