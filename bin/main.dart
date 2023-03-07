
import 'package:shelf/shelf.dart';
import 'api/login_api.dart';
import 'api/user_api.dart';
import 'dao/user_dao.dart';
import 'infra/authentication/authentication_interface.dart';
import 'infra/database/database_interface.dart';
import 'infra/middleware_interception.dart';
import 'infra/my_server.dart';
import 'api/example_api.dart';
import 'services/user_service.dart';
import 'utils/custom_env.dart';

void main() async {

  var cascadeHandler = Cascade()
      .add(LoginApi(AuthenticationInterface()).getHandler())
      .add(ExampleApi().getHandler())
      .add(UserApi(UserService(UserDao(DatabaseInterface()))).handler)    
      .handler;

   
  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addMiddleware(AuthenticationInterface().authorization)
      .addHandler(cascadeHandler);
  await MyServer.initialize(
      handler: handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
