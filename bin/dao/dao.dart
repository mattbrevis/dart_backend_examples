
abstract class DAO<T> {
  Future<List<T>> findAll(); 
  Future<T> findById(int id);
  Future<bool> create(T t);
  Future<bool> update(T t);
  Future<bool> delete(int id);  
}