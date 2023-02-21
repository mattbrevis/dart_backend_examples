
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler{
    final router = Router();

    router.get('/',(Request request){
      return Response(200, body: 'Teste');
    });
   
    router.get('/hello/<usuario>', (Request req, String user){
      return Response.ok('Hello $user');
    });

    router.get('/testqueryparam', (Request req){
      String? teste = req.url.queryParameters['teste'];
      return Response.ok('Ok $teste');
    });


    return router;
  }
  
}