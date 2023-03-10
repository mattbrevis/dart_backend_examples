import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'dart:convert';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserApi {
  final UserService _userService;
  UserApi(this._userService);
  static const String routeUser = '/user';
  Handler get handler {
    final router = Router();
    router.get(routeUser, (Request request) async {
      var result = await _userService.findAll();      
      var res = json.encode(result);      
      return Response(200, body: res);
    });

    router.post('$routeUser/create', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(400);
      var user = UserModel.fromJson(body);
      var result = await _userService.create(user);
      return result ? Response.ok('User created!') : Response(500);
    });

    router.delete('$routeUser/delete', (Request req) async {
      var result = await req.readAsString();
      Map bodyParam = jsonDecode(result);
      int id = bodyParam['id'] ?? 0;
      if (id > 0) {
        var res = await _userService.delete(id);
        if (res == true) {
          return Response.ok('User deleted!');
        } else {
          return Response.notFound('User not found!');
        }
      } else {
        return Response.notFound('User not found!');
      }
    });

    router.put('$routeUser/update', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(400);
      var user = UserModel.fromJson(body);
      var result = await _userService.update(user);
      return result ? Response.ok('User updated') : Response.badRequest();
    });

    return router;
  }



  
}
