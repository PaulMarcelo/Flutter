import 'package:floor/floor.dart';
import 'package:flutter_app_chopper/data/persistence/model/cliente.dart';

@dao
abstract class ClienteDao {
  @Query('SELECT * FROM cliente')
  Future<List<Cliente>> findAllCliente();

  @Query('SELECT * FROM cliente WHERE id = :id')
  Future<Cliente> findClienteById(int id);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertCliente(Cliente cliente);

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertClienteAll(List<Cliente> cliente);

  @Query('DELETE FROM cliente')
  Future<void> deleteAll();


}
