import 'package:floor/floor.dart';
import 'package:flutter_app_foto_localizacion/persistencia/modelo/producto.dart';

@dao
abstract class ProductoDao {
  @Query('SELECT * FROM producto')
  Future<List<Producto>> findAllProducto();

  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertProducto(Producto producto);

  @Query('DELETE FROM producto')
  Future<void> deleteAll();
}
