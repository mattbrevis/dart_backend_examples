
abstract class DatabaseConfig {
  Future<dynamic> createConnection();

  Future<dynamic> get connection;

  execQuery(String sql, [List? params]);
}