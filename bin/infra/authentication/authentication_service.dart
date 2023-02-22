
abstract class AuthenticationService<T> {
  Future<String> generateJWT(String userId);
  validateJWT(String jwt);

}