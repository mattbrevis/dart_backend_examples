import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UserApi {
  final UserService _userService;
  UserApi(this._userService);

  
  
  Future<bool> createUser(user) async=> await _userService.create(user);

  Handler get handler {
    final router = Router();
    router.post('/user', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(400);
      var user = UserModel.fromJson(body);
      var result = await createUser(user);
      return result ? Response(201) : Response(500);
    });

    return router;
  }
}
