import 'package:floor/floor.dart';

//Clase clientes faltan mas propiedades, en el ejemplo se uso solo 2 propiedades

@Entity(tableName: 'cliente')
class Cliente {
  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: 'codcli', nullable: false)
  String codcli;

  @ColumnInfo(name: 'nombrecli', nullable: false)
  String nombrecli;

  // Constructor con todos los parametros es requerido
  Cliente(this.codcli, this.nombrecli);

  // Constructor nombrado vacio opcional
  Cliente.vacio();
}
