import 'package:shelf/shelf_io.dart';
import 'server_handler.dart';

void main(List<String> args) async {  
  var _server = ServeHandler();
  final server = await serve(_server.handler, 'localhost', 33);
  print('Server listening on port ${server.port}');
}
