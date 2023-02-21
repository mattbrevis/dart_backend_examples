
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  ServeHandler._();
  factory ServeHandler()=> ServeHandler._();  
  
  static Handler get handler{
    final router = Router();
    final header = {'content-type' : 'application/json'};

    router.get('/',(Request request){
      return Response(200, body: 'Teste');
    });

    router.get('/hello/<usuario>', (Request req, String user){
      return Response.ok('Hello $user');
    });
    
    //test in your brownser http://localhost:33/testqueryparam?name=example&email=teste@mail.com
    router.get('/testqueryparam', (Request req){
      String? name = req.url.queryParameters['name'];
      String? email = req.url.queryParameters['email'];
      return Response.ok('Your name: $name \nYour email: $email');
    });
    
    router.post('/create/user',(Request req)async {
      var result = await req.readAsString();
      Map bodyParam = jsonDecode(result);
      String name = bodyParam['name'];
      String email =bodyParam['email'];

      if(name.isEmpty){
        return Response.forbidden('Name invalid');
      }else if(email.isEmpty){
        return Response.forbidden('Email invalid');
      }

      return Response.ok(jsonEncode(bodyParam), headers: header);
    });


    return router;
  }
  
}