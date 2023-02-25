import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UserApi {
  final UserService _userService;
  UserApi(this._userService);
  static const String routeUser = '/user';

  Future<bool> createUser(user) async => await _userService.create(user);

  Handler get handler {
    final router = Router();
    router.post(routeUser, (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(400);
      var user = UserModel.fromJson(body);
      var result = await createUser(user);
      return result ? Response(201) : Response(500);
    });
    router.delete('$routeUser/delete', (Request req) {
      //TODO: DELETE USER WITH MYSQL
      return Response.badRequest();
    });

    router.put('$routeUser/update', (Request req) async {
      //TODO: UPDATE USER WITH MYSQL
      return Response.badRequest();
    });

    router.post('$routeUser/create', (Request req) async {
      //TODO: CREATE USER WITH MYSQL
      return Response.badRequest();
    });
    return router;
  }
}
