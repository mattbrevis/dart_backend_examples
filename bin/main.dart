import 'infra/my_server.dart';
import 'api/server_handler.dart';
import 'utils/custom_env.dart';

void main() async {   
  await MyServer.initialize(
      handler: ServeHandler.handler,
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}
