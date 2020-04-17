import 'package:floor/floor.dart';

@Entity(tableName: 'producto')
class Producto {
  @PrimaryKey(autoGenerate: true)
  int id;
  @ColumnInfo(name: 'titulo', nullable: false)
  String titulo;
  @ColumnInfo(name: 'lat', nullable: false)
  String lat;
  @ColumnInfo(name: 'log', nullable: false)
  String log;
  @ColumnInfo(name: 'pathFoto', nullable: false)
  String pathFoto;

  Producto(this.id, this.titulo, this.lat, this.log, this.pathFoto);

  Producto.vacio();
}
