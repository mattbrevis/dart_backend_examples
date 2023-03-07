
import 'package:shelf/shelf.dart';

abstract class AuthenticationService<T> {
  Future<String> generateJWT(String userId);
  Future<T?>? validateJWT(String jwt);

  Middleware get authorization;
  Middleware get verifyJwt;
  
}