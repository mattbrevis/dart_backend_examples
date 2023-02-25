
abstract class AuthenticationService<T> {
  Future<String> generateJWT(String userId);
  Future<T?>? validateJWT(String jwt);

}