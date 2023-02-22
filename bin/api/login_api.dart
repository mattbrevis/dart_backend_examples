import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/authentication/authentication_interface.dart';

class LoginApi {
  final AuthenticationInterface authenticationService;
  
  LoginApi(this.authenticationService);
  Handler get handler {
    final router = Router();
    router.get('/login', (Request request) {      
      return Response.ok(authenticationService.generateJWT('1').toString());
    });

    return router;
  }
}
