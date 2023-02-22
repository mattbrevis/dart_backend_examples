
abstract class AuthenticationService<T> {
  Future<String> generateJWT(String userId);
  T? validateJWT(String jwt);

}