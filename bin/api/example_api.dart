import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'custom_api.dart';

class ExampleApi implements CustomApi{
  static final ExampleApi _instance = ExampleApi._internal();   
  static ExampleApi _internal() => _instance;
  static const String routeHome = '/home';  

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    final router = Router();

    router.get(routeHome, (Request request) {
      return Response(200, body: 'Welcome!');
    });

    router.get('$routeHome/<usuario>', (Request req, String user) {
      return Response.ok('Hello $user');
    });

    //test in your brownser http://localhost:33/testqueryparam?name=example&email=teste@mail.com
    router.get('$routeHome/testqueryparam', (Request req) {
      String? name = req.url.queryParameters['name'];
      String? email = req.url.queryParameters['email'];
      return Response.ok('Your name: $name \nYour email: $email');
    });

    router.delete('$routeHome/delete', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Test deleted $id');
    });

    router.put('$routeHome/update', (Request req) async {
      var result = await req.readAsString();
      Map bodyParam = jsonDecode(result);
      return Response.ok(jsonEncode(bodyParam));
    });

    router.post('$routeHome/create', (Request req) async {
      var result = await req.readAsString();
      Map bodyParam = jsonDecode(result);
      String name = bodyParam['name'];
      String email = bodyParam['email'];
      if (name.isEmpty) {
        return Response.forbidden('Name invalid');
      } else if (email.isEmpty) {
        return Response.forbidden('Email invalid');
      }
      return Response.ok(jsonEncode(bodyParam));
    });
    return router;
  }

  

  
}
