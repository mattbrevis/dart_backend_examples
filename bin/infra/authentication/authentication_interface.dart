
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../../utils/custom_env.dart';
import 'authentication_service.dart';

class AuthenticationInterface implements AuthenticationService<JWT>{
  @override
  Future<String> generateJWT(String userId) async{
    String key = await CustomEnv.get(key: 'jwt_key');

    var jwt = JWT({
     'iat' : DateTime.now().millisecondsSinceEpoch,
     'userId': userId,
     'roles': ['admin', 'user']
    });

    String token = jwt.sign(SecretKey(key));
    return token;    
  }

  @override
  JWT? validateJWT(String jwt) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }
  
}