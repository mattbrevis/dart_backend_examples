import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../infra/authentication/authentication_interface.dart';

class LoginApi {
  final AuthenticationInterface _authenticationService;
  static const String routeLogin = '/login';
  LoginApi(this._authenticationService);
  Handler get handler {
    final router = Router();
    router.post(routeLogin, (Request request) async{            
      return  Response.ok(await _authenticationService.generateJWT('1'));
    });
    return router;
  }
}
