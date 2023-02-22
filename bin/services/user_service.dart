
import '../dao/user_dao.dart';
import '../models/user_model.dart';

class UserService implements UserDao{
  UserService(this.user);
  UserDao user;
  @override
  Future<bool> create(UserModel userModel) => user.create(userModel);

  @override
  Future<bool> delete(int id) => user.delete(id);

  @override
  Future<List<UserModel>> findAll() => user.findAll();

  @override
  Future<UserModel> findById(int id) => user.findById(id);

  @override
  Future<bool> update(UserModel userModel) => user.update(userModel);
  
}