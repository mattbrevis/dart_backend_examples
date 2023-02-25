import 'package:password_dart/password_dart.dart';

import '../models/user_model.dart';
import 'user_service.dart';

class LoginService {
  final UserService _usuarioService;
  LoginService(this._usuarioService);

  Future<int> authenticate(UserModel userModel) async {
    try {
      var user = await _usuarioService.findById(int.parse(userModel.id.toString()));      
      if (Password.verify(userModel.password.toString(), user.password!)) {
        return user.id!;
      } else {
        return -1;
      }
    } catch (e) {
      print('[ERROR]- Authentication - User-EMail: ${userModel.email}');
    }
    return -1;
  }
}