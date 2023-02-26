import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'infra/authentication/authentication_interface.dart';
import 'infra/middleware_interception.dart';
import 'infra/my_server.dart';
import 'api/example_api.dart';
import 'utils/custom_env.dart';

void main() async {
  var cascadeHandler = Cascade()
      .add(LoginApi(AuthenticationInterface()).getHandler())
      .add(ExampleApi().getHandler())            
      .handler;
  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);
  await MyServer.initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
