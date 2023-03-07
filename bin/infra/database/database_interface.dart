import 'package:mysql1/mysql1.dart';

import '../../utils/custom_env.dart';
import 'database_config.dart';

class DatabaseInterface implements DatabaseConfig {
  MySqlConnection? _connection;

  @override  
  Future<MySqlConnection> get connection async {
    _connection ??= await createConnection();
    return _connection!;
  }

  @override
  Future createConnection() async =>
      await MySqlConnection.connect(
        ConnectionSettings(
          useSSL: false,
          host: await CustomEnv.get<String>(key: 'db_host'),
          port: await CustomEnv.get<int>(key: 'db_port'),
          user: await CustomEnv.get<String>(key: 'db_user'),
          password: await CustomEnv.get<String>(key: 'db_password'),
          db: await CustomEnv.get<String>(key: 'db_schema'),
        ),
        
      );

  @override
  execQuery(String sql, [List? params]) async{
    var conn = await connection;
    return await conn.query(sql, params);
  }
}
