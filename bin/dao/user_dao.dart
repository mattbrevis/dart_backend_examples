import '../infra/database/database_config.dart';
import '../models/user_model.dart';
import 'dao.dart';

class UserDao extends DAO<UserModel> {
  static const String userTable = 'users';
  final DatabaseConfig _dbConfiguration;
  UserDao(this._dbConfiguration);

  @override
  Future<bool> create(UserModel userModel) async {
    var result = await _dbConfiguration.execQuery(
      'INSERT INTO $userTable (nickname, email) VALUES (?, ?)',
      [userModel.nickname, userModel.email],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration
        .execQuery('DELETE from $userTable where id = ?', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<List<UserModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM $userTable');
    return result.map((r) => UserModel.fromMap(r.fields)).toList();
  }

  @override
  Future<UserModel> findById(int id) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM  $userTable where id = ?', [id]);
    return UserModel.fromMap(result);
  }

  @override
  Future<bool> update(UserModel userModel) async{
    var result = await _dbConfiguration.execQuery(
      'UPDATE $userTable set nickname = ?, email = ? where id = ?',
      [userModel.nickname, userModel.email],
    );
    return result.affectedRows > 0;
  }
}
