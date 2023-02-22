
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../../utils/custom_env.dart';
import 'authentication_service.dart';

class AuthenticationInterface extends AuthenticationService{
  @override
  Future<String> generateJWT(String userId) async{
    String key = await CustomEnv.get(key: 'jwtkey');

    var jwt = JWT({
     'iat' : DateTime.now().millisecondsSinceEpoch,
     'userId': userId,
     'roles': ['admin', 'user']
    });

    String token = jwt.sign(SecretKey(key));
    return token;
    

  }

  @override
  validateJWT(String jwt) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }
  
}