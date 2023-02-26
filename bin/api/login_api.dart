import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../infra/authentication/authentication_interface.dart';
import 'custom_api.dart';

class LoginApi implements CustomApi{
  final AuthenticationInterface _authenticationService;
  static const String routeLogin = '/login';
  LoginApi(this._authenticationService);    

  @override
  Handler getHandler({List<Middleware>? middlewares}) {
    final router = Router();
    router.post(routeLogin, (Request request) async{            
      return  Response.ok(await _authenticationService.generateJWT('1'));
    });
    return router;
  }
}
